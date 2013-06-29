module Tapir
  module Entities
    class Person < Base
      include TenantAndProjectScoped

      field :first_name, type: String
      field :last_name, type: String
      field :middle_name, type: String
      field :email_addresses, type: String
      
      has_many :usernames
      accepts_nested_attributes_for :usernames, :allow_destroy => true

      def name
        "#{first_name} #{last_name}"
      end
      
    private

      def default_values
        self.usernames ||= []
      end

    end
  end
end
