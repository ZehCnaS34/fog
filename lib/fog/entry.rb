require 'byebug'
require 'action_view'

module Fog
  class Entry
    include ActionView::Helpers
    include ActionView::Helpers::Tags

    attr_accessor :section, :output_buffer

    def initialize section
      @section = section
      @safe_name = section.safe_name
    end

    # return html string
    def text h
      single_type h do |name, options|
        TextField.new(@safe_name, name, nil, options).render
      end
    end

    # return html string
    def paragraph
      single_type h do |name, options|
        TextArea.new(@safe_name, name, nil, options).render
      end
    end

    # return html string
    def select h
      multi_type h do |name, selections, options|
        Select.new(@safe_name,name,nil, selections,{},options).render
      end
    end

    # return html string
    def checkbox h
    end

    private

    def single_type hash, &block
      n = hash["name"]
      hash.delete("name")
      output = block.call n, hash
    end

    def multi_type hash, &block
      n = hash["name"]
      hash.delete("name")
      s = hash["options"]
      hash.delete("options")
      output = block.call n, s, hash
    end
  end
end
