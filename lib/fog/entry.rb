require 'byebug'
require 'action_view'

module Fog
  class Entry
    include ActionView::Helpers
    include ActionView::Helpers::Tags

    attr_accessor :section, :output_buffer

    def initialize section
      @section = section
      @safe_name = section["safe_name"]
    end

    # return html string
    def text h
      parse_hash h do |name, options|
        TextField.new(@safe_name, name, nil, options).render
      end
    end

    # return html string
    def paragraph h
      parse_hash h do |name, options|
        TextArea.new(@safe_name, name, nil, options).render
      end
    end

    # return html string
    def select h
      Select.new(@safe_name,
                 h["name"],
                 :idk,
                 h["options"],
                {},{}).render
    end

    # return html string
    def checklist o_hash
      "todo"
    end

    private

    def parse_hash hash, &block
      n = hash["name"]
      hash.delete("name")
      output = block.call n, hash
    end
  end
end
