require 'rails/generators/base'

class BaseGenerator < Rails::Generators::Base
  API_CONTROLLER_PATH = 'app/controllers/api_controller.rb'.freeze
  
  def self.exit_on_failure?
    true
  end
  
  private

  # Removes other serialization gems, currently just AMS and FastJsonapi
  def remove_other_supported_gems
    log_statement('ActiveModelSerializers', :yellow)
    gsub_file('Gemfile', /^(\ngem 'active_model_serializers')/, '')
    
    log_statement('FastJsonapi', :yellow)
    gsub_file('Gemfile', /^(\ngem 'fast_jsonapi')/, '')
  end

  # Adds an ApiController if one does not exist to ensure proper encapsulation,
  # especially if in a Rails monolith with Rails HTML views as well
  def copy_api_controller
    puts set_color('Checking if an ApiController exists...', :cyan)
    unless File.exists?('app/controllers/api_controller.rb')
      puts set_color('ApiController not present, creating ApiController...', :cyan)
      template 'api_controller.rb', API_CONTROLLER_PATH
    end
  end


  def log_statement(serializer, color = :green)
    puts set_color("Removed #{serializer}", color)
  end
end