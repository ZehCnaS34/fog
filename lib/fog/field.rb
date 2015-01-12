module Fog
  class Field
    include ActionView::Helpers
    attr_accessor :question, :helper, :required, :entry, :output_buffer
    def initialize h
      h.each{ |k,v| send("#{k}=",v) }
    end

    def to_html
      content_tag :div, {class: "fog-question-container"}, false do
        output = ""
        output << content_tag(:p, @question, class: "fog-question")
        output << content_tag(:small, @helper, class: "fog-helper")
        output << @entry.to_html
        output
      end
    end
  end
end
