require 'action_view'

module Fog
  class HtmlGenerator
    include Fog::Formater
    include ActionView::Helpers
    include ActionView::Helpers::Tags

    attr_accessor :output_buffer

    def generate
      raise "no implementation"
    end

    private

    def tag_map
      {
        "text"      => TextField,
        "textarea"  => TextArea,
        "checkbox"  => CheckBox,
        "select"    => Select
      }
    end

    def arg_map obj,base,name
      {
        TextField => Proc.new { |attrs| obj.new(base,name,nil,attrs) },
        TextArea  => Proc.new { |attrs| obj.new(base,name,nil,attrs) } ,
        CheckBox  => Proc.new { |attrs| obj.new(base,name,nil,true,false,attrs) },
        Select    => Proc.new { |m,  a| obj.new(base,name,nil,m,{},a) }
      }[obj]
    end
  end
end
