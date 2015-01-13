require 'byebug'
module Fog
  class Section
    include ActionView::Helpers
    attr_accessor :title, :sub_title,:fields, :output_buffer
    def initialize h
      # h.each{ |k,v| send("#{k}=",v) }
      @title = h["title"]
      @sub_title = h["sub_title"]
      h["fields"].each do |f|
        add_field f["question"], f["helper"], f["required"], f["entry"]
      end
    end

    def add_field question, helper, required, entry={}
      @fields = []
      # byebug
      entry_type = entry.keys[0]
      entry_hash = entry[entry_type]
      e = Entry.new self
      # send will try to call one of the supported
      # entry methods
      # e.g. text, paragraph, select
      field = Field.new({
                          :question => question,
                          :helper   => helper,
                          :required => required,
                          :entry    => e.send(entry_type, entry_hash)
                        })
      @fields << field
    end

    def to_html
      content_tag :div, {class: "fog-section"}, false do
        output = ""
        output << content_tag(:h2, @title, class: "fog-section-title")
        output << content_tag(:h5, @sub_title, class: "fog-section-sub_title")
        output << @fields.map{ |field| field.to_html }.join(' ')
        output
      end
    end

  end
end
