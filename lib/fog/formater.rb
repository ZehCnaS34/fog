module Fog
  module Formater
    def format_entry hash
      raise "no input type given" if not hash.has_key?("type")
      tag_type = hash["type"]
      name     = hash["name"]
      choices  = hash["choices"]

      hash.delete("choices")
      hash.delete('type')
      hash.delete('name')
      options  = hash
      [tag_type,name,options,choices]
    end

    def format_field hash
      raise "no question" if not hash.has_key?("question")
      question = hash["question"]
      help = hash["help"]
      entries = hash["entries"]
      [question,help,entries]
    end

    def format_section hash
      raise "no title" if not hash.has_key?("title")
      raise "invalid error" if not hash["title"].is_a?(String)
      object_name = hash["object_name"]
      title       = hash["title"]
      sub_title   = hash["sub_title"]
      fields      = hash["fields"]
      [title, sub_title, object_name, fields]
    end
  end
end
