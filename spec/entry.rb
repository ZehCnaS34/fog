require 'rspec'
require 'fog'

RSpec.describe Fog::Entry do

  context "Entry#text" do
    context "when given valid text" do
      before :each do
        @entry = Fog::Entry.new(Object.new)
      end

      it "should be a valid html" do
        expect(@entry.text({:name => "awesome"})).to eq('<input name="awesome" type="text">')
      end
    end
  end
end
