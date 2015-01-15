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
{
 "title" => "this is the title",
 "sub_title" => "this is the subtitle",
 "sections" => [{
                 "object_name" => "objct",
                 "title" => "section title",
                 "sub_title" => "section sub title",
                 "fields" => [{
                               "question" => "what is 2 + 2",
                               "help" => "its literally that easy",
                               "entries" => [
                                             {
                                              "type" => "text",
                                              "placeholder" => "something",
                                              "value" => "this is pretty cool",
                                              "name" => "bruh"
                                             },
                                             {
                                              "type" => "text",
                                              "placeholder" => "the fix",
                                              "name" => "dafix"
                                             },
                                            ]
                              },{
                                 "question" => "what is that good good",
                                 "help" => "only real G's know",
                                 "entries" => [
                                               {
                                                "type" => "checkbox",
                                                "label" => "Kush",
                                                "name" => "kush"
                                               },
                                               {
                                                "type" => "checkbox",
                                                "label" => "Blue Dream",
                                                "name" => "bd"
                                               },
                                               {
                                                "type" => "select",
                                                "name" => "something",
                                                "choices" => {
                                                              "Display" => "d",
                                                              "Look" => "l"
                                                             }
                                               }
                                              ]
                                }]
                }]
}

```

this will start to create

## Contributing

1. Fork it ( https://github.com/ZehCnaS34/fog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
