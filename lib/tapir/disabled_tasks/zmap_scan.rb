def name
  "zmap_scan"
end

def pretty_name
  "Zmap Scan"
end

## Returns a string which describes what this task does
def description
  "This task runs a zmap scan on the target range."
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [ Entities::NetBlock]
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
  @range_path = "#{Dir::tmpdir}/zmap_range_#{rand(100000000)}.temp"
  @output_path = "#{Dir::tmpdir}/zmap_output_#{rand(100000000)}.temp"
  File.open(@range_path,"w").write(@entity.range)


  # shell out to nmap and run the scan
  @task_logger.log "scanning #{@entity.range} and storing in #{@range_path}"
  @task_logger.log "zmap options: #{zmap_options}"
  
  zmap_string = "sudo zmap -p 80 -B 10M -w #{@range_path} -o #{@output_path}"
  @task_logger.log "calling zmap: #{zmap_string}"
  safe_system(zmap_string)
    
  # Gather the output and parse
  @task_logger.log "Raw Result:\n #{File.open(@output_path).read}"
  @task_logger.log "Parsing #{@output_path}"

  f = File.open(@output_path).each_line do |host|
    host = host.delete("\n").strip unless host.nil?
    # Create entity for each discovered host + service
    @host_entity = create_entity(Entities::Host, {:name => host })
    create_entity(Entities::NetSvc, {
      :name => "#{host}:80/tcp",
      :host_id => @host_entity.id,
      :port_num => 80,
      :proto => "tcp",
      :fingerprint => "zmapped"})
  end

end

def cleanup
  super
  File.delete(@range_path)
  File.delete(@output_path)
end
