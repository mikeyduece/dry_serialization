require 'bundler/setup'
Bundler.setup
require 'dry_serialization'
require 'factory_bot'
require_relative 'activerecord_helper'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  
  config.after(:each) do
    FileUtils.rm_rf('app')
  end
  
end