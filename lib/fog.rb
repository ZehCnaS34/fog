require "fog/version"
require 'fog/formater'
require 'fog/html_generator'
require 'fog/entry'
require 'fog/field'
require 'fog/form'
require 'fog/section'

module Fog
  class Core
    def initialize(hash)
      @form  = Fog::Form.new(hash)
      @form.serialize_sections
    end

    def generate
      @form.generate
    end
  end
end
