module Fog
  class Entry
    def select name, options
      opts = []
      options.each do |k,v|
        opts << Option.new(v,k)
      end
      Select.new(name, opts)
    end

    def checkbox name, value
      CheckBox.new({name: name, value: value})
    end

    def text name, value, placeholder
      Text.new(name, value, placeholder)
    end

    def paragraph name, value
      Paragraph.new(name,value)
    end
  end
end
