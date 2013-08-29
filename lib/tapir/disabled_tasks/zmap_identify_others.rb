def name
  "zmap_identify_others"
end

def pretty_name
  "Zmap Identify Other Systems"
end

## Returns a string which describes what this task does
def description
  "This task runs a zmap scan on the target range."
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
  
  zmap_string = "sudo zmap -p #{@entity.port_num} -N 100 -B 10M -o #{@output_path}"
  @task_logger.log "calling zmap: #{zmap_string}"
  safe_system(zmap_string)
    
  # Gather the output and parse
  @task_logger.log "Raw Result:\n #{File.open(@output_path).read}"
  @task_logger.log "Parsing #{@output_path}"

  f = File.open(@output_path).each_line do |host|
    # Create entity for each discovered host + service
    @task_logger.log "Creating Host: #{host}"
    @host_entity = create_entity(Entities::Host, {:name => host.strip })
    @task_logger.log "Creating Port: #{}"
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
  File.delete(@range_path)
  File.delete(@output_path)
end
