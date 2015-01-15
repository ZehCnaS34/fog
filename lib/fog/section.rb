module Fog
  class Section
    attr_reader :title, :subtitle, :fields, :safe_name
    attr_accessor :output_buffer
    def initialize hash
      @title,@sub_title,@object_name,@fields=format_section hash
    end

    def serialize_fields

    end
  end
end
