require 'resque/server'

def find_secure_token
  token_file = Rails.root.join('.secret')
  if File.exist? token_file
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token of 64 random hexadecimal characters and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Resque.mongo = Mongo::Connection.new.db("resque")
Resque::Server.use(Rack::Auth::Basic) do |user, password|
  password == find_secure_token
end