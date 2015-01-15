require 'fog'

RSpec.describe Fog::Entry do
  before :each do
    @entry = Fog::Entry.new
    @text_field = {
                   "type" => "text",
                   "placeholder" => "something",
                   "value" => "this is pretty cool",
                   "name" => "bruh"
                  }
  end

  context "textfield generation" do
    it "should properly assign attrs into the object" do
      @entry.format @text_field
      expect(@entry.name).to eq("bruh")
      expect(@entry.tag).to eq("text")
      expect(@entry.attributes).to eq({
                                       "value" => "this is pretty cool",
                                       "placeholder" => "something"
                                      })
    end

  end

end
