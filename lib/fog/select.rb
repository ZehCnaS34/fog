module Fog
  class Select
    include Fog::Html
    attr_accessor :name, :values, :options

    def initialize name, values, options
      @name,@values,@options=name,values,options
    end

    def to_html
      opts = @options.map { |v| v.to_html }
      "<select #{attrs(name_attr(@name))}>#{opts}</select>"
    end
  end
end
