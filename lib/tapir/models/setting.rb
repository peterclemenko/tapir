module Tapir
class Setting
  include Mongoid::Document
  include Mongoid::Timestamps

  include TenantScoped

  belongs_to :user

  field :name, type: String
  field :value, type: String
  field :visibility, type: String

  validates_uniqueness_of :name

end
end