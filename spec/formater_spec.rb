require 'fog'

class T
  include Fog::Formater
end

RSpec.describe Fog::Formater do

  describe "when valid hash." do
    before :each do
      @p = T.new
      @valid_entry = {
                "type"        => "text",
                "placeholder" => "something",
                "value"       => "this is pretty cool",
                "name"        => "bruh"
               }
      @valid_choice_entry = {
                       "type"        => "select",
                       "name"        => "bruh",
                       "choices"     => {
                                         "Display" => "d",
                                         "Look"    => "l"
                                        }
                      }
    end


    context "#format_entry" do
      it "place tag_type, name, and option into an array [tag_type,name,options]" do

        ## assignments
        tag_type,name,options = @p.format_entry(@valid_entry)

        ## expectations
        expect(tag_type).to eq("text")
        expect(name).to eq("bruh")
        expect(options).to eq({
                               "value"       => "this is pretty cool",
                               "placeholder" => "something",
                              })
      end
    end


    context "#with_choices" do
      it "should extract the choices like so => [choices, hash]" do
        ## assignments
        tag_type,name,choices,options = @p.format_entry(@valid_choice_entry,true)

        ## expectations
        expect(choices).to        eq({"Display" => "d","Look" => "l"})
        expect(options).to        eq({})
        expect(tag_type).to       eq("select")
        expect(name).to           eq("bruh")

      end
    end

  end
end
