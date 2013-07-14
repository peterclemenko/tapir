module Tapir
  class ReportTemplate
    include Mongoid::Document

    field :name, type: String
    field :content, type: String

    validates_uniqueness_of :name  
  end
end