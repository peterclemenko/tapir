#!/usr/bin/env ruby
require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Tapir::Tenant.current = Tapir::Tenant.all.first
Tapir::Project.current = Tapir::Project.all.first

f = File.open(ARGV[0], "r")

puts "Importing..."
f.each { |line| 
	d = Tapir::Entities::Domain.create(
    :name => line.chomp,
    :tenant_id => Tapir::Tenant.current.id,
    :project_id => Tapir::Project.current.id)
}
puts "Done."
