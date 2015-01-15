require 'rspec'
require 'fog'

RSpec.describe Fog::EntryParser do
  describe "when given a valid hash" do
    before :each do
      @entry = {
                "type" => "text",
                "placeholder" => "something",
                "value" => "this is pretty cool",
                "name" => "bruh"
               }
    end

    it "should properly place, name and option into an array accordingly"

  end
end
