module Fog
  class Paragraph 
    include Fog::Html
    attr_accessor :name, :value
    def initialize name, value
      @name = name
      @value = value
    end

    def to_html
      "<textearea name='#{@name}'>#{@value}</textarea>"
    end
  end
end
