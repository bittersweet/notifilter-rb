require "./lib/notifilter"
require "byebug"

describe Notifilter do
  around do |spec|
    @server = UDPSocket.new
    @server.bind("127.0.0.1", "8001")
    ENV["NOTIFILTER_PORT"] = "8001"
    spec.run
    @server.close
  end

  it "sends correct message" do
    data = { "id" => 1, "name" => "John Doe", "active" => false }
    Notifilter.notify("test_app", "user.created", data)

    received = @server.recv(1000)
    result = { "application" => "test_app", "identifier" => "user.created", "data" => data }
    expect(JSON.parse(received)).to eq result
  end
end
