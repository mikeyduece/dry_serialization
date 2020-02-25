require 'rails/generators/base'

class BaseGenerator < Rails::Generators::Base
  
  def self.exit_on_failure?
    true
  end

  def copy_api_controller
    unless File.exists?('app/controllers/api_controller.rb')
      puts 'ApiController not present, creating ApiController...'
      template 'api_controller.rb', 'app/controllers/api_controller.rb'
    end
  end
  
  private

  def log_statement(serializer, color = :green)
    puts set_color("Removed #{serializer}", color)
  end
end