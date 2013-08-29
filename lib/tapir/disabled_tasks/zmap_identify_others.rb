def name
  "zmap_identify_others"
end

def pretty_name
  "Identify Other Systems with the same port open, using Zmap"
end

## Returns a string which describes what this task does
def description
  "This task runs a zmap scan to find other systems with the same open service."
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [ Entities::NetSvc ]
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

  # Grab options
  zmap_options = @options['zmap_options']
  
  # Write the range to a path
  @output_path = "#{Dir::tmpdir}/zmap_output_#{rand(100000000)}.temp"

  # shell out to nmap and run the scan
  @task_logger.log "zmap options: #{zmap_options}"
  
  zmap_string = "sudo zmap -p #{@entity.port_num} -N 10 -B 10M -o #{@output_path}"
  @task_logger.log "calling zmap: #{zmap_string}"
  safe_system(zmap_string)
    
  # Gather the output and parse
  @task_logger.log "Raw Result:\n #{File.open(@output_path).read}"
  @task_logger.log "Parsing #{@output_path}"

  f = File.open(@output_path).each_line do |host|
    next if host.nil?
    host = host.delete("\n").strip 
    # Create entity for each discovered host + service
    @host_entity = create_entity(Entities::Host, {:name => host })
    create_entity(Entities::NetSvc, {
      :name => "#{host}:#{@entity.port_num}/tcp",
      :host_id => @host_entity.id,
      :port_num => @entity.port_num,
      :proto => "tcp",
      :fingerprint => "zmapped"})
  end

end

def cleanup
  super
  File.delete(@output_path)
end
