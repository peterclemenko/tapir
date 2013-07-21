#!/usr/bin/env ruby
puts "Loading Rails environment"
require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Tapir::Tenant.current = Tapir::Tenant.all.first
Tapir::Project.current = Tapir::Project.all.first

top_domains = File.join current_dir, "..", "data", "domain_top1k.list"
f = File.open(top_domains, "r")

puts "Importing #{top_domains}"
f.each { |line| 
	d = Tapir::Entities::Domain.create(
    :name => line.chomp,
    :tenant_id => Tapir::Tenant.current.id,
    :project_id => Tapir::Project.current.id)
}
puts "Done."
