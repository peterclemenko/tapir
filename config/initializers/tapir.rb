require "#{Rails.root}/lib/tapir"

#
# Task Manager Setup
#
TaskManager.instance.load_tasks

###
###  config - todo, find a better place for this
###

module AppConfig 
  APP_NAME="TAPIR!"
end