require 'action_view'

module Fog
  class Form
    include ActionView::Helpers
    attr_accessor :title, :sub_title, :sections, :output_buffer

    def initialize h
      h.each{ |k,v| send("#{k}=",v) }
      @sections = []
    end

    def add_section section_hash
      @sections << Section.new(section_hash)
    end

    def to_html
      content_tag :div, {class: "fog-form"} do
        output = ""
        output << content_tag(:h1, @title)
        output << content_tag(:h2, @sub_title)
        output << form_for(:fog_form, build_sections, class: "something")
        output.html_safe
      end

      private

      def build_sections
        @sections.map{ |s| s.to_html }.join(' ')
      end
    end
  end
end
