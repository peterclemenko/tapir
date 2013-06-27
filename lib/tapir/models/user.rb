module Tapir
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  include TenantScoped
  
  field :username, type: String
  field :email, type: String

  has_many :settings
  
end
end