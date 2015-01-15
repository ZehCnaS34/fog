require 'byebug'
module Fog
  class Field
    include ActionView::Helpers
    attr_accessor :question, :helper, :required, :entries, :output_buffer
    def initialize h
      h.each{ |k,v| send("#{k}=",v) }
    end

    def to_html
      output = ""
      output << content_tag(:p, @question, class: "fog-question")
      output << content_tag(:small, @helper, class: "fog-helper")
      output << @entries.join('')
      content_tag :div, output, {class: "fog-question-container"}, false
    end
  end
end
