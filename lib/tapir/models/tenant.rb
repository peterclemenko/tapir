class Tenant
  include Mongoid::Document
  include Mongoid::Timestamps
  
  validates_uniqueness_of :host  

  class << self
    def current
      Thread.current[:current_tenant]
    end
 
    def current=(tenant)
      Thread.current[:current_tenant] = tenant
    end
  end

end