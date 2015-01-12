require "fog/version"

module Fog
  class Entry
    def checkbox name, value, options
      CheckBox.new({name: name, value: value, options: options})
    end

    def select name, values, options
    end

    def text name, values, options
    end

    def paragraph name, values, options
    end
  end
end


e = Entry.new

e.send :paragraph, "name", [1,2], "1" => "one" # => <#Paragrapn @name+=2309>
