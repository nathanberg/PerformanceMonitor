require 'byebug'

require 'rails'
module Perfmon
  class Railtie < Rails::Railtie
    initializer "perfmon.configure_rails_initialization" do |app|
      app.middleware.use Perfmon::Middleware
    end
  end
end