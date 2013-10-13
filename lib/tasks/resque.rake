require 'resque/tasks'

# preload the rails environment
task "resque:setup" => :environment
