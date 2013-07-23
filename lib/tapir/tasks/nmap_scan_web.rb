def name
  "nmap_scan_web"
end

def pretty_name
  "Nmap Scan Web"
end

## Returns a string which describes what this task does
def description
  "This task runs an nmap scan on the target host or domain to detect common web ports."
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [ Tapir::Entities::Domain, 
    Tapir::Entities::Host, 
    Tapir::Entities::NetBlock]
end

## Returns an array of valid options and their description/type for this task
def allowed_options
 []
end

def setup(entity, options={})
  super(entity, options)
end

## Default method, subclasses must override this
def run
  super
  
  nmap_options = @options['nmap_options']
  
  if @entity.kind_of? Tapir::Entities::Host
    to_scan = @entity.name
  elsif @entity.kind_of? Tapir::Entities::NetBlock
    to_scan = @entity.range
  elsif @entity.kind_of? Tapir::Entities::Domain
    to_scan = @entity.name
  else
    raise ArgumentError, "Unknown entity type"
  end
  
  @rand_file_path = "#{Dir::tmpdir}/nmap_scan_#{to_scan}_#{rand(100000000)}.xml"
  
  # shell out to nmap and run the scan
  @task_logger.log "scanning #{to_scan} and storing in #{@rand_file_path}"
  @task_logger.log "nmap options: #{nmap_options}"
  
  safe_system("nmap -P0 #{to_scan} #{nmap_options} -p 80,443,8080,8081 -oX #{@rand_file_path}")
  
  # Gather the XML and parse
  @task_logger.log "Raw Result:\n #{File.open(@rand_file_path).read}"
  @task_logger.log "Parsing #{@rand_file_path}"

  parser = Nmap::Parser.parsefile(@rand_file_path)

  # Create entitys for each discovered service
  parser.hosts("up") do |host|

    @task_logger.log "Handling nmap data for #{host.addr}"

    # Handle the case of a netblock or domain - where we will need to create host entity(s)
    master_entity = @entity
    if @entity.kind_of? Tapir::Entities::NetBlock or @entity.kind_of? Tapir::Entities::Domain
      @entity = create_entity(Tapir::Entities::Host, {:name => host.addr })
    end

    [:tcp, :udp].each do |proto_type|
      host.getports(proto_type, "open") do |port|
      @task_logger.log "Creating Service: #{port}"
      create_entity(Tapir::Entities::NetSvc, {
        :name => "#{@entity.name}:#{port.num}/#{port.proto}",
        :host_id => @entity.id,
        :port_num => port.num,
        :proto => port.proto,
        :fingerprint => "#{port.service.name} #{port.service.product} #{port.service.version}"})
      end
      # reset this back to the main task entity & loop
      @entity = master_entity
    end
  
  end
end

def cleanup
  super
  File.delete(@rand_file_path)
end
