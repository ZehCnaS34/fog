module Fog
  class Text
    attr_accessor :name, :value, :placeholder
    def initialize name, value, placeholder
      @name = name
      @value = value
      @placeholder = placeholder
    end

    def to_html
      "<input type='text' #{[Attr::name(@name), Attr::placeholder(@placeholder)].join(" ")} />"
    end
  end
end
