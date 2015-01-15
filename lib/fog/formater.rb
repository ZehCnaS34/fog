module Fog
  module Formater
    def format_entry hash, with_choices=false
      raise "fuck" if not hash.has_key?("type")
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

    def format_field hash
      raise "no question" if not hash.has_key?("question")
      question = hash["question"]
      help = hash["help"]
      entries = hash["entries"]
      [question,help,entries]
    end
  end
end
