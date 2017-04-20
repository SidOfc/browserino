# frozen_string_literal: true

require 'action_controller/railtie'

module Browserino
  class ActionController
    module Base
      def client
        @client ||= Browserino.parse request.headers['User-Agent']
      end
    end
  end
end
