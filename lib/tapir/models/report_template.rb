module Tapir
  class ReportTemplate
    include Mongoid::Document
    field :name, type: String
    field :pretty_name, type: String
    field :template, type: String
    field :setup, type: String

    validates_uniqueness_of :name  
  end
end