# HelloThrift

This is a simple "Hello World" usage of [Thrift RPC](https://thrift.apache.org/) in Ruby. It was developed 
to test simple integration of a Thrift service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hello_thrift'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hello_thrift

## Usage

### Start a HelloThrift::Server

    $ bundle exec hellothrift.start

### Use the HelloThrift::Client to call the server

```ruby
client = HelloThrift::Client.new
client.say_hello( 'Bob' )
#=> "Hello, Bob from Thrift!"
```

## Re-generating from new IDL

The hello_service.thrift IDL (interface definition) looks as follows:
```thrift
service HelloService {
  string say_hello(1: string name)
}
```

Feel free to experiment with [modifying this interface](https://thrift.apache.org/docs/idl). You can then regenerate the Ruby client and server stubs using the following command:

    $ thrift --gen rb -out ../lib/hello_thrift/hello_service hello_service.thrift

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hello_thrift/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
