#!/usr/bin/env ruby
require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Tapir::Tenant.current = Tapir::Tenant.all.first
Tapir::Project.current = Tapir::Project.all.first

# open up a list of domains
f = File.open(ARGV[0], "r")

puts "Running..."
f.each do |line| 
  begin 
    h = Tapir::Entities::Host.create(
      :name => line.strip,
      :tenant_id => Tapir::Tenant.current.id,
      :project_id =>Tapir::Project.current.id)
  rescue Exception => e
    puts "ohnoes! #{e}"
  end
end
