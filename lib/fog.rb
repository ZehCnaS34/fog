require "fog/version"
require 'fog/entry'
require 'fog/field'
require 'fog/section'
require 'fog/form'

module Fog
  class Core
    attr_accessor :form, :output_buffer
    def initialize structure
      @form = structure
    end


    def to_html
    end
  end
end
