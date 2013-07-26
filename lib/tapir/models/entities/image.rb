
module Entities
  class Image < Base
    include TenantAndProjectScoped

    field :local_path, type: String
    field :remote_path, type: String
    field :description, type: String

    def filename
      self.local_path.split(File::SEPARATOR).last
    end

  end
end