module Fog
  class Field
    include Fog::Formater
    attr_reader :question, :help, :entries

    def initialize h
      @question, @help, @entries = format_field h
    end

    def setup_entries(section_name)
      e = Entry.new(section_name)
      @entries = @entries.map { |entry|
        e.format(entry)
      }
    end

  end
end
