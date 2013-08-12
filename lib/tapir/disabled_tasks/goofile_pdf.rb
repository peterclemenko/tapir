# Returns the name of this task.
def name
  "goofile_pdf"
end

def pretty_name
  "Goofile PDF"
end

# Returns a string which describes this task.
def description
  "This task hits Google and finds PDF files for a given domain."
end

# Returns an array of valid types for this task
def allowed_types
  [ 
    Entities::DnsRecord
  ]
end

def setup(entity, options={})
  super(entity, options)
  self
end

# Default method, subclasses must override this
def run
  super

  # Attach to the google service & search
  results = Client::Google::SearchScraper.new.search("filetype:pdf site:#{@entity.name}")

  results.each do |result|
    create_entity Entities::PdfFile, :name => result
  end

end

def cleanup
  super
end
