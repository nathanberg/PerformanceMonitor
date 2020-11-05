require "perfmon/version"
require 'perfmon/middleware'
require 'yaml'
require "perfmon/railtie" if defined? Rails

module Perfmon
  class << self
    def config
      @config ||= Config.new
    end

    def configure
      yield(config)
    end
  end
end
