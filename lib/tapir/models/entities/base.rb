module Tapir
  module Entities
    class Base

      include Mongoid::Document
      include Mongoid::Timestamps

      include TenantAndProjectScoped

      include EntityHelper

      field :name, type: String
      field :status, type: String
      field :confidence, type: Integer

      validates_uniqueness_of :name, :scope => [:tenant_id,:project_id]
      
      def to_s
        "#{entity_type.capitalize}: #{name}"
      end

      # Class method to convert to a path
      def self.underscore
        self.class.to_s.downcase.gsub("::","_")
      end

      def all
        entities = []

        Tapir::Entities::Base.unscoped.descendants.each do |x|
          x.all.each {|y| entities << y } unless x.all == [] 
        end
        
      entities
      end

      def task_runs
        Tapir::TaskRun.where(:task_entity_id => id).all
      end

      def model_name
        self.model_name
      end

      extend ActiveModel::Naming

    end
  end
end