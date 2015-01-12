module Fog
  class Section
    include ActionView::Helpers
    attr_accessor :title, :sub_title, :fields
    def initialize h
      h.each{ |k,v| send("#{k}=",v) }
    end

    def add_field question, help, required, entry={}
      etype = entry.keys[0]
      eoptions = entry[etype]
      e = Entry.new self
      e.send etype, eoptions
      field = Field.new(question: question, help: help, required: required, entry: e)
      @fields << field
    end

    def to_html
      content_tag :div, class: "fog-section" do
        content_tag :h2, @title, class: "fog-section-title"
        content_tag :h5, @sub_title, class: "fog-section-sub-title"
      end
    end
  end
end
