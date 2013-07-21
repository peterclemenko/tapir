#!/usr/bin/env ruby
require 'pry'

puts "Loading Rails environment"
require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Tapir::Tenant.current = Tapir::Tenant.all.first
Tapir::Project.current = Tapir::Project.all.first

Pry.start(self, :prompt => [proc{"tapir>"}])
