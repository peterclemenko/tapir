#!/usr/bin/env ruby
# Blatently stolen and modified from a version by 
# Torsten Becker <torsten.becker@gmail.com>
# https://gist.github.com/torsten/74107

puts "Loading Rails environment"

require "#{File.join(File.dirname(__FILE__), "..", "config", "environment")}"
require 'webrick' 
require 'webrick/httpproxy' 

# Set the current tenant - this is required because
# all entities must be scoped according to the tenant
Tapir::Tenant.current = Tapir::Tenant.all.first
Tapir::Project.current = Tapir::Project.all.first

s = WEBrick::HTTPProxyServer.new(
    :Port => 8080,
    :RequestCallback => Proc.new { |req,res| 
      begin
        Tapir::Entities::Domain.create(
          :name => "#{req.host}",
          :tenant_id => Tapir::Tenant.current.id,
          :project_id => Tapir::Project.current.id)
      rescue Exception => e
        puts "Exception #{e}"
      end
    }
  )

# Shutdown functionality
trap("INT"){s.shutdown}

# Go
puts "Proxytime -> localhost:8080"
s.start