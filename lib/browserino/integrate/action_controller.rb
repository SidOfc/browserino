require 'action_controller/railtie'

module Browserino
  class ActionController
    module Base
      def agent
        Browserino::parse request.headers['User-Agent']
      end
    end
  end
end
