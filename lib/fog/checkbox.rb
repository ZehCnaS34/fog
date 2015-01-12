module Fog
  class CheckBox
    include Fog::Html
    attr_accessor :name, :checked
    def initialize name, c=false
      @name = name if name.is_a?(String)
      if c.is_a?(TrueClass) || c.is_a?(FalseClass)
        @checked = c
      else
        @checked = false
      end
    end
    def check
      @checked = true
    end
    def uncheck
      @checked = false
    end
    def toggle
      if @checked
        @checked = false
      else
        @checked = true
      end
    end
    def is_checked?
      if @checked == true
        true
      else
        false
      end
    end

    def to_html
      "<input type='checkbox' #{[name_attr(@name),checked_attr(@checked)].join(' ')}/>"
    end
  end
end
