require 'fog'

class T
  include Fog::Formater
end

RSpec.describe Fog::Formater do
  before :each do
    @f = T.new
    @section = {
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
                                                             },
                                                "class" => "awesome"
                                               }
                                              ]
                                }]
                }
  end

  context "when given valid text"

end
