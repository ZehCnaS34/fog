module Fog
  class Section < HtmlGenerator
    attr_reader :title, :sub_title, :fields, :safe_name

    def initialize hash
      @title,@sub_title,@safe_name,@fields=format_section hash
    end

    def serialize_fields
      @fields = @fields.map { |f|
        field = Field.new(f)
        field.serialize_entries(@safe_name)
        field.clone
      }
    end

    def generate
      content_tag :div, class: "fog-section" do
        output = ""
        output << content_tag(:div, class: "fog-section-header") do
          o = ""
          o << content_tag(:h2, @title)
          o << content_tag(:h3, @sub_title)
          o.html_safe
        end
        output << content_tag(:div, class: "fog-fields") do
          @fields.map{ |f| f.generate }.join('').html_safe
        end
        output << submit_tag
        output.html_safe
      end
    end
  end
end
