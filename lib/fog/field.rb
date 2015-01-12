module Fog
  class Field
    attr_accessor :question, :help, :entry, :required
    include ActionView::Helpers

    def initialize h
      @question, @help, @required=h["question"],h["help"],h["required"]



    end

    def to_html

    end

  end
end
