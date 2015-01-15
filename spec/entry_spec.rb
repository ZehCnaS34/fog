require 'spec_helper'

RSpec.describe Fog::EntryParser do

  describe "when valid hash." do
    before :each do
      @entry = {
                "type"        => "text",
                "placeholder" => "something",
                "value"       => "this is pretty cool",
                "name"        => "bruh"
               }
    end

    it "should properly place, name and option into an array [tag_type,name,options]" do
      tag_type,name,options = parse_entry @entry

      expect(tag_type).to be("text")
      expect(name).to be("bruh")
      expect(options).to be({
                             "placeholder"=>"something",
                             "value"=>"this is pretty cool"
                            })
    end

  end
end
