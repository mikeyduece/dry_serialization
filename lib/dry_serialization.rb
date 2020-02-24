require "dry_serialization/version"
require 'dry_serialization/configuration'
require "dry_serialization/blueprinter"

module DrySerialization
  
  class << self
    attr_accessor :configuration
  end

  def self.configuration(&block)
    @configuration ||= Configuration.new
  end
  
  def self.configure
    yield(configuration)
  end
end
