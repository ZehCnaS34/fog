module Fog
  class Option
    include Fog::Html
    attr_accessor :display, :value
    def initialize display, value
      @display = display
      @value = value
    end

    def to_html
      "<option #{[value_attr(@value)].join(' ')}>#{@display}</option>"
    end
  end
end
