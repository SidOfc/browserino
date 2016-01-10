require 'rails/railtie'
require_relative 'action_controller'

module Browserino
  class Railtie < ::Rails::Railtie
    initializer 'browserino.init_on_action_controller' do
      ActiveSupport.on_load :action_controller do
        include Browserino::ActionController::Base
      end
    end
  end
end
