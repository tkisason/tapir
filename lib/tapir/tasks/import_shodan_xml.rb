def name
  "import_shodan_xml"
end

## Returns a string which describes what this task does
def description
  "This is a task to import SHODAN xml."
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [ParsableFile]
end

def setup(entity, options={})
  super(entity, options)
end

## Default method, subclasses must override this
def run
  super

  # Create our parser
  xml = Tapir::Import::ShodanXml.new
  parser = Nokogiri::XML::SAX::Parser.new(xml)
  # Send some XML to the parser
  parser.parse(File.read(@entity.path))
  
  xml.shodan_hosts.each do |shodan_host|
    #
    # Create the host / loc / domain entity for each host we know about
    #
    domain = create_entity(Domain, {:name => shodan_host.hostnames }) if shodan_host.hostnames.kind_of? String
    host = create_entity(Host, {:ip_address => shodan_host.ip_address })
    loc = create_entity(PhysicalLocation, {:city => shodan_host.city, :country => shodan_host.country})

    shodan_host.services.each do |shodan_service|
      #
      # Create the service and associate it with our host above
      #
      host.net_svcs << create_entity(NetSvc, {
        :port_num => shodan_service.port,
        :type => "tcp",
        :fingerprint => shodan_service.data })
    end # End services processing
    
    #
    # Associate the domain & location w/ the host
    #
    host.domains << domain
    host.physical_locations << loc
  end # End host processing
  
end

def cleanup
  super
end
