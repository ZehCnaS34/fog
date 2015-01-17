require "fog/version"
require 'fog/formater'
require 'fog/html_generator'
require 'fog/entry'
require 'fog/field'
require 'fog/section'

module Fog
  class Core

    def initialize
      @e = Fog::Entry.new("awesome")
      @e.format({
                 "type" => "checkbox",
                 "label" => "Kush",
                 "name" => "kush"
                })
    end

    def debug
      @e.generate
    end

  end
end
