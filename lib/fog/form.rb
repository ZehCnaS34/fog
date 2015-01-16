module Fog
  class Form < HtmlGenerator
    attr_reader :title, :sub_title, :sections
    def initialize hash
      @title,@sub_title,@sections = format_form hash
    end
  end
end
