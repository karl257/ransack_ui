require 'ransack_ui/view_helpers'
require 'ransack_ui/controller_helpers'

module RansackUI
  module Rails
    class Engine < ::Rails::Engine
      initializer 'ransack_ui.view_helpers' do
        ActionView::Base.include ViewHelpers
      end

      initializer 'ransack_ui.controller_helpers' do
        ActionController::Base.include ControllerHelpers
      end
    end
  end
end
