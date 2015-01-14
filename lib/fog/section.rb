require 'byebug'
module Fog
  class Section < Base
    include ActionView::Helpers
    attr_accessor :title,:sub_title,:fields,:safe_name,:output_buffer
    def initialize h
      ## When passing a hash
      # h.each{ |k,v| send("#{k}=",v) }
      @title = h["title"]
      @fields = []
      @sub_title = h["sub_title"]
      @safe_name = h["safe_name"]
      h["fields"].each do |f|
        add_field f["question"], f["helper"], f["required"], f["entry"]
      end
    end

    def add_field question, helper, required, entry={}

      # entry_type = entry.keys[0]
      # entry_hash = entry[entry_type]
      entry_type,entry_hash = parse_entry entry

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
      content_tag :div, class: "fog-section" do
        output = ""
        output << content_tag(:h2, @title, class: "fog-section-title")
        output << content_tag(:h5, @sub_title, class: "fog-section-sub_title")
        output << @fields.map{ |field| field.to_html }.join(' ').html_safe
        output.html_safe
      end
    end

    private

    def parse_entry h
      e_type = h.keys[0]
      e_hash = h[e_type]
      [e_type, e_hash]
    end

  end
end
