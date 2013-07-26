#!/usr/bin/env ruby
puts "Loading Rails environment"
require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Tenant.current = Tenant.all.first
Project.current = Project.all.first

# add in a lookup
Entities::Host.all.each do |h|
    puts "Name         : #{h}"
end

puts "Done."