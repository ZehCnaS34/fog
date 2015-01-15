module Fog
  class HtmlGenerator
    include Fog::Formater
    include ActionView::Helpers
    attr_accessor :output_buffer
    def generate
      raise "no implementation"
    end
  end
end
