module Fog
  class Section < HtmlGenerator
    attr_reader :title, :sub_title, :fields, :safe_name

    def initialize hash
      @title,@sub_title,@object_name,@fields=format_section hash
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
        output << content_tag(:h2, @title)
        output << content_tag(:h3, @subtitle)
        output << content_tag(:div, class: "fog-field") do
          @fields.map{ |f| f.generat }.join('').html_safe
        end
        output.html_safe
      end
    end
  end
end
