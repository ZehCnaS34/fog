require 'byebug'
require 'action_view'

module Fog
  class Entry < HtmlGenerator
    # base [String]
    # tag [String]
    # name [String]
    # choices [Hash] key=[Display], value=[key]
    # attributes [Hash]
    attr_reader :base,:tag,:name,:attributes,:choices

    def initialize(base_name)
      @base = base_name
    end

    def format(entry)
      # choices does not always have a value
      @hash = entry
      @tag,@name,@attributes,@choices = format_entry entry
      self
    end

    def generate
      obj = tag_map[@tag]
      gen = arg_map(obj,@base,@name)

      if @choices
        gen[@choices,@attributes].render
      else
        gen[@attributes].render
      end
    end
  end
end
