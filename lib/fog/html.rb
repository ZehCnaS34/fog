module Fog
  module Html
    def name_attr name
      "name='#{name}'"
    end

    def checked_attr checked
      return "checked" if checked
    end

    def value_attr value
      "value='#{value}'"
    end

    def placeholder_attr value
      "placeholder='#{value}'"
    end
  end
end
