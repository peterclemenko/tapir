#!/usr/bin/env ruby
puts "Loading Rails environment"
require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Tenant.current = Tenant.all.first
Project.current = Project.all.first

top_domains = File.join current_dir, "..", "data", "domain_top1k.list"
f = File.open(top_domains, "r")

puts "Importing #{top_domains}"
f.each { |line| 
	d = Entities::DnsRecord.create(
    :name => line.chomp,
    :tenant_id => Tenant.current.id,
    :project_id => Project.current.id)
}
puts "Done."
