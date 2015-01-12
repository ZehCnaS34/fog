module Fog
  class Form
    include Actionview::Helpers
    attr_accessor :title, :sub_title, :sections, :output_buffer

    def initialize h
      h.each{ |k,v| send("#{k}=",v) }
    end

    def add_section section_hash
      @sections << Section.new(section_hash)
    end

    def to_html
      content_tag :div, {class: "fog-form"}, false do
        output = ""

        output << content_tag(:h1, @title)
        output << content_tag(:h2, @sub_title)
        output << @sections.map{ |s| s.to_html }.join(' ')

        output
      end
    end
  end
end
