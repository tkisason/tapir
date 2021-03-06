# Returns the name of this task.
def name
  "edgar_search"
end

# Returns a string which describes this task.
def description
  "This task hits the Corpwatch API and creates an entity for all found entities."
end

# Returns an array of valid types for this task
def allowed_types
  [SearchString]
end

def setup(entity, options={})
  super(entity, options)
  self
end

# Default method, subclasses must override this
def run
  super

  # Attach to the corpwatch service & search
  x = Tapir::Client::Corpwatch::CorpwatchService.new
  corps = x.search @entity.name

  corps.each do |corp|
    # Create a new organization entity & attach a record
    o = create_entity Organization, { 
      :name => corp.name, 
    }
    o.physical_locations << create_entity(PhysicalLocation, {
      :address => corps.first.address, 
      :state => corps.first.state,
      :country => corps.first.country }
      )
  end
  
  #@task_run.save_raw_result corps.to_s

  # Queue a detailed search
  TaskManager.instance.queue_task_run("hoovers_company_detail",o, {})
end

def cleanup
  super
end
