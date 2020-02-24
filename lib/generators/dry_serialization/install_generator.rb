require 'rails/generators/base'

module DrySerialization
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)
    
    def copy_initializer
      template 'dry_serialization.rb', 'config/intializers/dry_serialization.rb'
    end
  end
end