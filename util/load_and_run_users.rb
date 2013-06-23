#!/usr/bin/env ruby

puts "Loading Rails environment"
require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Mongoid::Multitenancy.current_tenant = Tapir::Tenant.all.first

users=["ladygaga","justinbieber","katyperry","shakira","KimKardashian","britneyspears"]

puts "Running..."
# For each domain
users.each do |user| 
  puts "trying #{user}"
  begin 

    # create the user entity
    u = Tapir::Entities::User.create(
      :usernames => [user],
      :tenant_id => Tapir::Tenant.all.first.id
      )
    u.run_task "twitpic_photo_locations"

  rescue Exception => e
    puts "ohnoes! #{e}"
  end
end
puts "Done."
