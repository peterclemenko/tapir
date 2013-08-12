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
Tenant.current = Tenant.all.first
Project.current = Project.all.first

s = WEBrick::HTTPProxyServer.new(
    :Port => 8080,
    :RequestCallback => Proc.new { |req,res| 
      begin
        Entities::DnsRecord.create(
          :name => "#{req.host}",
          :tenant_id => Tenant.current.id,
          :project_id => Project.current.id)
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