require 'byebug'
require 'action_view'

module Fog
  class Entry
    include ActionView::Helpers
    include ActionView::Helpers::Tags
    attr_accessor :section, :output_buffer
  end
end
