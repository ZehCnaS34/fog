module Fog
  module Formater
    def format_entry hash, with_choices=false
      tag_type = hash["type"]
      name     = hash["name"]
      if with_choices
        choices = hash["choices"]
        hash.delete("choices")
      end
      hash.delete('type')
      hash.delete('name')
      options  = hash
      return [tag_type,name,choices, options] if with_choices
      [tag_type,name,options]
    end
  end
end
