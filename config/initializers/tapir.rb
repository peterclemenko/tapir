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

### 
### Monkeypatch string so we can check before eval'ing
###
class String
  
    def to_class
        Kernel.const_get self
    rescue NameError 
        nil
    end

    def is_a_defined_class?
        true if self.to_class
    rescue NameError
        false
    end
end