require 'socket'
require 'json'

class Notifilter
  def self.notify(key, data)
    message = {"identifier" => key, "data" => data}.to_json

    begin
      socket = UDPSocket.new
      socket.send(message, 0, "127.0.0.1", 8000)
    rescue Exception => e
      puts "Exception in Notifilter: #{e.message}"
    ensure
      socket.close if socket
      true
    end
  end
end
