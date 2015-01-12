module Fog
  class Select
    include Fog::Html
    attr_accessor :display, :value

    def initialize display, value
      @display = display
      @value = value
    end

    def to_html
      "<option #{attrs(value_attr(@value))}>#{@display}</option>"
    end
  end
end
