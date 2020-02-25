require 'rails/generators/base'

class BaseGenerator < Rails::Generators::Base
  
  def self.exit_on_failure?
    true
  end

  def remove_other_supported_gems(*gems)
    gems = [gems] unless gems.is_a?(Array)
    return if gems.empty?
    
    puts set_color('Removing other supported gems', :orange)
    gems.each do |gem|
      run "gem uninstall #{gem.underscore}"
      log_statement(gem)
    end
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