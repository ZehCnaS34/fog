require 'byebug'
require 'action_view'

module Fog
  class Entry
    include ActionView::Helpers
    include ActionView::Helpers::Tags
    attr_accessor :section, :output_buffer

    def fn_map
      {
       "text" => :single_type,
       "paragrph" => :single_type
      }
    end

    def method_missing n,*args
      fn_map[n].to_proc.call(args[0]) do |name,options|
        puts name,options
      end
    end

    def initialize section
      @section     = section
      @object_name = section.object_name
    end

    # return html string
    def text h
      single_type h do |name, options|
        TextField.new(@object_name, name, nil, options).render
      end
    end

    # return html string
    def paragraph
      single_type h do |name, options|
        TextArea.new(@object_name, name, nil, options).render
      end
    end

    # return html string
    def select h
      multi_type h do |name, selections, options|
        Select.new(@object_name,name,nil, selections,{},options).render
      end
    end

    # return html string
    def checkbox h
      single_type(h) { |name, options|
        CheckBox.new(@object_name,name,nil,true,false,{},options).render
      }
    end

    private

    def single_type hash, &block
      n = hash["name"]
      hash.delete("name")
      block.call n, hash
    end

    def multi_type hash, &block
      n = hash["name"]
      hash.delete("name")
      s = hash["options"]
      hash.delete("options")
      block.call n, s, hash
    end
  end
end
