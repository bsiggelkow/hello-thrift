require_relative 'hello_service/hello_service'

module HelloThrift

  class Client
    attr_reader :client

    def initialize(options={})
      port = options[:port] || 9090
      transport = Thrift::BufferedTransport.new(Thrift::Socket.new('localhost', port))
      protocol = Thrift::BinaryProtocol.new(transport)
      @client = HelloService::Client.new(protocol)
      transport.open
    end

    def say_hello(name)
      client.say_hello(name)
    end
  end

end

# client = HelloThrift::Client.new

# loop do
#   print "What is your name? "
#   input = gets.strip
#   break if input == 'quit'
#   puts client.say_hello(input)
# end