require_relative 'hello_service/hello_service'

module HelloThrift

  class Handler
    def say_hello(name)
      puts "Saying hello to #{name}"
      "Hello, #{name} from Thrift!"
    end
  end

  class Server
    attr_reader :service

    def initialize(options={})
      port = options[:port] || 9090
      handler = Handler.new
      processor = HelloService::Processor.new(handler)
      transport = Thrift::ServerSocket.new(port)
      transportFactory = Thrift::BufferedTransportFactory.new
      @service = Thrift::SimpleServer.new(processor, transport, transportFactory)
    end

    def serve
      service.serve
    end
  end

end