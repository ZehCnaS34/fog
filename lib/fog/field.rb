module Fog
  class Field < HtmlGenerator
    attr_reader :question, :help, :entries

    def initialize h
      @question,@help,@entries = format_field h
    end

    def serialize_entries section_name
      e = Entry.new(section_name)
      @entries = @entries.map { |entry|
        e.format(entry).clone
      }
    end

    def generate
      content_tag :div, class: "fog-field" do
        output = ""
        output << content_tag(:p, @qeustion)
        output << content_tag(:small, @help)
        output << content_tag(:div, class: "fog-entries") do
          @entries.map{ |e| e.generate }.join("<br/>").html_safe
        end
        output.html_safe
      end
    end
  end
end
