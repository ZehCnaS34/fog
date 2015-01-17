module Fog
  class Form < HtmlGenerator
    attr_reader :title, :sub_title, :sections
    def initialize hash
      @title,@sub_title,@sections = format_form hash
    end


    def serialize_sections
      @sections = @sections.map { |s|
        section = Section.new(s)
        section.serialize_fields
        section.clone
      }
    end

    def generate
      content_tag :div, class: "fog-form" do
        output = ""
        output << content_tag(:div, class: "fog-form-header") do
          o = ""
          o << content_tag(:h2, @title)
          o << content_tag(:h3, @sub_title)
          o.html_safe
        end
        output << content_tag(:div, class: "fog-sections") do
          @sections.map{ |f| f.generate }.join('').html_safe
        end
        output.html_safe
      end
    end

  end
end
