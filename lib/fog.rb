require "fog/version"
require 'fog/entry'
require 'fog/field'
require 'fog/section'
require 'fog/form'

module Fog
  class Core

    attr_accessor :form, :output_buffer

    def initialize s

      f = Form.new(title: s["title"], sub_title: s["sub_title"])

      s["sections"].each do |sec|
        f.add_section sec
      end

      @form = f
    end

    def to_html
      @form.to_html
    end
  end
end
