require 'action_view'
module Fog
  class Entry
    include ActionView::Helpers
    include ActionView::Helpers::Tags

    attr_accessor :section, :output_buffer

    def initialize section
      @section = section
    end

    # return html string
    def text options
      default = {"type" => "text"}
      options.merge! default
      tag :input, options
    end

    # return html string
    def paragraph content, options={}
      content_tag :textarea, content, options
    end

    # return html string
    def select name, options
      "TODO"
    end

    # return html string
    def checklist
      'TODO'
    end

    def to_html

    end
  end
end
