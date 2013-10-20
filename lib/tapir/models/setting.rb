class Setting
  include Mongoid::Document
  include Mongoid::Timestamps

  include TenantScoped

  belongs_to :user

  field :name, type: String
  field :value, type: String
  field :visible, type: Boolean

  validates_uniqueness_of :name, :scope => :tenant_id
  validates_presence_of :user, :scope => :tenant_id
end