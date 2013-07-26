#!/usr/bin/env ruby
puts "Loading Rails environment"
require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Tenant.current = Tenant.all.first
Project.current = Project.all.first

f = File.open(ARGV[0], "r")

puts "Importing..."
f.each { |line| 
	d = Entities::Organization.create(
    :name => line.chomp,
    :tenant_id => Tenant.current.id,
    :project_id => Project.current.id)
}
puts "Done."
