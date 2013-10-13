require 'resque/server'

Resque.mongo = Mongo::Connection.new.db("resque")
