module Fog
  class Field
    attr_accessor :question, :helper, :required, :entry
    def initialize h
      h.each{ |k,v| send("#{k}=",v) }
    end
  end
end
