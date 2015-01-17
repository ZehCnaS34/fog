require 'action_view'

module Fog
  class HtmlGenerator
    include Fog::Formater
    include ActionView::Helpers
    include ActionView::Helpers::Tags

    attr_accessor :output_buffer


    def parse
    end

    def generate
      raise "no implementation"
    end

    private

    def tag_map
      {
       :text      => [TextField ,  :base],
       :textarea  => [TextArea  ,  :base],
       :checkbox  => [CheckBox  , :check],
       :select    => [Select    ,  :coll],
      }
    end
  end
end
