require 'action_view'

module Fog
  class HtmlGenerator
    include Fog::Formater
    include ActionView::Helpers
    include ActionView::Helpers::Tags
    attr_accessor :output_buffer
    def generate
      raise "no implementation"
    end
  end
end
