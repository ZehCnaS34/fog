module Fog
  class Entry
    include ActionView::Helpers
    def text options
      default = {"type" => "text"}
      options.merge! default
      tag :input, options
    end
    def paragraph content, options={}
      content_tag :textarea, content, options
    end
    def
    end
  end
end
