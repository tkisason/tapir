def name
  "example"
end

## Returns a string which describes what this task does
def description
  "This is an example Tapir task. It associates a random host with the calling entity."
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [Domain, Host, Organization, SearchString, User]
end

def setup(entity, options={})
  super(entity, options)
end

## Default method, subclasses must override this
def run
  super
  # create an ip
  ip_address = "#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}"
  x = create_entity Host, { :ip_address => ip_address }
end

def cleanup
  super
end
