module Fog
  class Section
    include Formater
    attr_reader :title, :subtitle, :fields, :safe_name
    attr_accessor :output_buffer
    def initialize hash
      @title,@sub_title,@object_name,@fields=format_section hash
    end

    def serialize_fields
      @fields = @fields.map { |f|
        field = Field.new(f)
        field.serialize_entries(@safe_name)
        field.clone ## i might take this out.
      }
    end

    def generate
      content_tag :div, class: "fog-section"
    end
  end
end
