require 'rails/railtie'
require_relative 'action_controller'

module Browserino
  class Railtie < Rails::Railtie
    config.browser = ActiveSupport::OrderedOpts.new

    initializer 'browserino' do
      ::ActionController::Base.send :include,  Browserino::ActionController
    end
  end
end
