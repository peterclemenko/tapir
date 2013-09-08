
require 'socket'
require 'openssl'

def name
  "gather_ssl_certificate"
end

def pretty_name
  "Gather SSL Certificate"
end

## Returns a string which describes what this task does
def description
  "This task allows you to gather an SSL Certificate."
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [ Entities::NetSvc ]
end

## Returns an array of valid options and their description/type for this task
def allowed_options
end

def setup(entity, options={})
  super(entity, options)
end

## Default method, subclasses must override this
def run
  super

  begin
    # Create a socket and connect
    tcp_client = TCPSocket.new @entity.host.name, @entity.port_num
    ssl_client = OpenSSL::SSL::SSLSocket.new tcp_client
    
    # Grab the cert
    ssl_client.connect

    # Parse the cert
    cert = OpenSSL::X509::Certificate.new(ssl_client.peer_cert)
    
    # Close the sockets
    ssl_client.sysclose
    tcp_client.close

    # Create an SSL Certificate entity
    create_entity Entities::SslCert, { :name => cert.subject, :text => cert.to_text } 
  rescue OpenSSL::SSL::SSLError => e
    @task_logger.log "Caught an error: #{e}"
  end
end

def cleanup
  super
end
