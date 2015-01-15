module Fog
  module EntryParser
    def parse_entry hash
      tag_type = hash["type"]
      name = hash["name"]
      hash.delete('type')
      hash.delete('name')
      options = hash
      [tag_type, name,options]
    end
  end
end
