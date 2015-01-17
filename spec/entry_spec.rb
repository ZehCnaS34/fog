require 'fog'

RSpec.describe Fog::Entry do
  before :each do
    @entry = Fog::Entry.new("base name")
    @text_field = {
                   "type"        => "text",
                   "placeholder" => "something",
                   "value"       => "this is pretty cool",
                   "name"        => "bruh"
                  }

    @checkbox = {
                 "type"  => "checkbox",
                 "label" => "Kush",
                 "name"  => "kush"
                }

  end

  context "text generation" do
    it "map the hash into the object" do
      @entry.format @text_field
      expect(@entry.name       ).to eq("bruh")
      expect(@entry.tag        ).to eq("text")
      expect(@entry.attributes ).to eq({
                                       "value"       => "this is pretty cool",
                                       "placeholder" => "something"
                                      })
      expect(@entry.choices).to eq nil
    end
  end

  context "checkbox generation" do
    before :all do
      @entry = Fog::Entry.new("test")
    end

    it '#format' do
      @entry.format @checkbox
      expect(@entry.name).to eq("kush")
      expect(@entry.tag).to eq("checkbox")
    end

    it '#generate' do
      expect(@entry.generate).to eq("")
    end
  end

end
