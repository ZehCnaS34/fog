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

        output << form_for(:fog_form, class: "something") do
          @sections.map{ |s| s.to_html }.join(' ').html_safe
        end.html_safe

        output.html_safe
      end
    end
  end
end
