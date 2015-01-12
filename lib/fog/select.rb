module Fog
  class Select
    include Fog::Html
    attr_accessor :name, :options

    def initialize name, values, options
      @name,@options=name,options
    end

    def to_html
      opts = @options.map { |v| v.to_html }.join('')
      "<select #{attrs(name_attr(@name))}>#{opts}</select>"
    end
  end
end
