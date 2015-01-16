require 'fog'

class T
  include Fog::Formater
end

RSpec.describe Fog::Formater do
  before :each do
    @f = T.new
    @form = {
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
                                                                         },
                                                            "class" => "awesome"
                                                           }
                                                          ]
                                            }]
                            }]
            }

  end

  it "should parse out the proper fields" do
    title, sub_title, section = @f.format_form @form
    expect(title).to eq("this is the title")
    expect(sub_title).to eq("this is the subtitle")
    expect(section.class).to eq(Array)
  end
end
