require 'socket'
require 'json'

class Notifilter
  def self.application
    ENV["NOTIFILTER_APPLICATION"]
  end

  def self.host
    ENV["NOTIFILTER_HOST"] || "127.0.0.1"
  end

  def self.port
    ENV["NOTIFILTER_PORT"] || 8000
  end

  def self.notify(identifier, data)
    if application.nil?
      puts "[NOTIFILTER] Application is not set, ignoring event"
      return
    end

    message = {
      "application" => application,
      "identifier" => identifier,
      "data" => data
    }.to_json

    begin
      socket = UDPSocket.new
      socket.send(message, 0, host, port)
    rescue Exception => e
      puts "Exception in Notifilter: #{e.message}"
    ensure
      socket.close if socket
      true
    end
  end
end
