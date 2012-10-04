class Organization
  #has_many    :domains
  #has_many    :users
  #has_many    :physical_locations
  #has_many    :hosts, :through => :domains
  #has_many    :net_svcs, :through => :hosts
  #has_many    :web_apps, :through => :net_svcs
  #has_many    :web_forms, :through => :web_apps
  #has_many    :task_runs
  #validates_uniqueness_of :name
  #validates_presence_of :name

  include Mongoid::Document
  include EntityHelper

  field :name, type: String
  field :status, type: String
  field :confidence, type: Integer  
  field :description, type: String
  field :created_at, type: Time
  field :updated_at, type: Time

  def to_s
    "#{self.class}: #{self.name}"
  end

end
