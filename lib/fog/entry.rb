module Fog
  class Entry
    def select name, values, options
    end

    def checkbox name, value
      CheckBox.new({name: name, value: value})
    end

    def text name, value
    end

    def paragraph name, value
    end
  end
end
