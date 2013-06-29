module Tapir
  module Entities
    class Domain < Base      
      include TenantAndProjectScoped

      field :record_created_on, type: Time
      field :record_updated_on, type: Time
      field :record_expires_on, type: Time
      field :disclaimer, type: String 
      field :registrar_name, type: String
      field :registrar_org, type: String
      field :registrar_url, type: String
      field :referral_whois, type: String
      field :registered, type: String
      field :available, type: String
      
      validates_presence_of :name, :scope => [:tenant_id,:project_id]
      validates_uniqueness_of :name, :scope => [:tenant_id,:project_id]

      belongs_to :host

    end
  end
end