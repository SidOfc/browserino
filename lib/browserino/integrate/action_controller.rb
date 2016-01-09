require 'action_controller/railtie'

module Browserino
  module ActionController
    extend ActiveSupport::Concern

    included { helper_method(:browser) }

    def browser
      @agent ||= Browserino::parse request.headers['User-Agent']
    end
  end
end
