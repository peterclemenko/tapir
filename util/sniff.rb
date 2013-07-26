#!/usr/bin/env ruby

puts "Loading Rails environment"

require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"
require "packetfu"

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Tenant.current = Tenant.all.first
Project.current = Project.all.first

@excluded = [ "^172.16", "^192.168" , "^74.16", "^74.125", "^224.0.0", "^199.71", "^199.43", "^199.212"]
@included = [ "^10.0.0" ]

ethernet_adapter = ARGV[0]

raise ArgumentError, "Please specify interface" unless ethernet_adapter

@cap = PacketFu::Capture.new(:iface => ethernet_adapter,
  :start => true,
  :filter => "ip")

puts "Using tenant: #{Tenant.all.first.host}"
puts "Using network adapter: #{ethernet_adapter}"
puts "[+] We be sniffin!"

@cap.stream.each do |pkt| 

  #  begin
  packet = PacketFu::Packet.parse(pkt)

  # Check to see if it's in our exclusion list
  excluded = false

  @excluded.each do |excluded_regex|
      if Regexp.new(excluded_regex).match(packet.ip_daddr.to_s)
        excluded = true
        break
      end
  end

  next unless !excluded || !packet.is_ip?
  
  #Check to see if we have the host's details already
  host = Entities::Host.where(
    :name => packet.ip_daddr, 
    :project_id => Project.current.id,
    :tenant_id => Tenant.current.id)

  next if host.count > 0

  puts "[+] Creating new host: #{packet.ip_daddr}"
  h = Entities::Host.create(
    :name => packet.ip_daddr, 
    :project_id => Project.current.id,
    :tenant_id => Tenant.current.id)

  h.run_task("dns_reverse_lookup", {})

end
