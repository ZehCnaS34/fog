module Fog
  class CheckBox
    include Fog::Html
    attr_accessor :name, :value, :options
    def initialize args
      args.each do |k,v|
        instance_variables_set("@#{k}", v) unless v.nil?
      end
    end

    def to_html
    end
  end
end
