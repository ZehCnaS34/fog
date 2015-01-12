module Fog
  class Text
    include Fog::Html
    attr_accessor :name, :value, :placeholder
    def initialize name, value, placeholder
      @name = name
      @value = value
      @placeholder = placeholder
    end

    def to_html
      "<input type='text' #{[name_attr(@name),value_attr(@value),placeholder_attr(@placeholder)].join(' ')} />"
    end
  end
end
