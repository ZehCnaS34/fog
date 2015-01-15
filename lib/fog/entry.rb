require 'byebug'
require 'action_view'

module Fog
  class Entry < HtmlGenerator
    include ActionView::Helpers::Tags
    include Fog::Formater

    # base [String]
    # tag [String]
    # name [String]
    # Choices [Hash] key=[Display], value=[key]
    # attributes [Hash]
    attr_reader :base,:tag,:name,:choices,:attributes,:hash

    def initialize(base_name)
      @base = base_name
    end

    def tag_map
      {
       :text      => [TextField ,  :base],
       :textarea  => [TextArea  ,  :base],
       :checkbox  => [CheckBox  , :check],
       :select    => [Select    ,  :coll],
      }
    end

    def format(entry)
      # choices does not always have a value
      @hash = entry
      @tag,@name,@attributes,@choices = format_entry entry
      self
    end

    def generate
      gen = entry_type(*tag_map[@tag.to_sym])
      gen.render.html_safe
    end

    private

    def entry_type obj,type
      if type == :base
        obj.new(@base,@name,nil, @attributes)
      elsif type == :check
        obj.new(@base,@name,nil,true,false,@attriubtes)
      elsif type == :coll
        obj.new(@base,@name,nil,@choices,{},@attriubtes)
      end
    end

  end
end
