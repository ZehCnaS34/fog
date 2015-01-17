require 'fog'

class T
  include Fog::Formater
end

RSpec.describe Fog::Formater do
  before :each do
    @p = T.new
    @field = {
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
             }
  end

  it  "format field into [question,help,entries]" do
    question, help, entries = @p.format_field @field
    expect(question).to eq("what is 2 + 2")
    expect(help).to eq("its literally that easy")
    expect(entries.class).to eq(Array)
  end

end
