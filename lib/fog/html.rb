module Fog
  module Attr
    def name n
      "name='#{n}'"
    end
    def checked b
      return "checked" if b
    end
    def placeholder v
      "placeholder='#{v}'"
    end
    def value v
      "value='#{v}'"
    end
  end
  module Html
    def name_attr name
      "name='#{name}'"
    end

    def checked_attr checked
      return "checked" if checked
    end
  end
end
