require 'byebug'

module Fog
  class Section < Base
    include ActionView::Helpers
    attr_accessor :title,:sub_title,:fields,:object_name,:output_buffer
    def initialize h
      ## When passing a hash
      # h.each{ |k,v| send("#{k}=",v) }
      @title = h["title"]
      @fields = []
      @sub_title = h["sub_title"]
      @object_name = h["object_name"]
      h["fields"].each do |f|
        add_field f["question"], f["helper"], f["entries"]
      end
    end

    def add_field question, helper, entries={}
      ema = parse_entries(entries)
      # create a new entry instance
      # send will try to call one of the supported
      # entry methods
      # e.g. text, paragraph, select
      field = Field.new({
                         :question => question,
                         :helper   => helper,
                         :entries  => finalize_entries(ema)
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

    def finalize_entries(entries)
      e = Entry.new self
      entries.map { |type,options| e.send(type,options) }.join("<br/>")
    end

    ## parse entries
    def parse_entries entries
      byebug
      entries.map{|k,v| {:elt=>k,:options=>v} }
    end
  end
end
