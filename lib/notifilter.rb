require 'socket'
require 'json'

class Notifilter
  def initialize(application, host = nil, port = nil)
    @application = application
    @host = host || "127.0.0.1"
    @port = port || "8000"
  end

  def notify(identifier, data)
    message = {
      application: @application,
      identifier: identifier,
      data: data
    }.to_json

    begin
      socket = UDPSocket.new
      socket.send(message, 0, @host, @port)
    rescue Exception => e
      puts "Exception in Notifilter: #{e.message}"
    ensure
      socket.close if socket
      true
    end
  end
end
