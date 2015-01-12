# Fog

This gem generates an html form given a specifically structured ruby hash.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fog'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fog

## Usage

creating a form

```ruby
ff = Fog::Form.new {
  "title" => "Some title"
  "subtitle" => "bru.",
  "fields" => [
    {
      "question"=> "this is the question",
      "help"=> "this may help the use",
      "entry"=> {
        "text"=> {"name"=>"someting",
        "placeholder"=>"something",
        "value"=>"something",
      }
    }, ##  This will be a little more in-depth
    "required"=> true
    }
]
}
```

this will start to create

## Contributing

1. Fork it ( https://github.com/ZehCnaS34/fog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
