require 'generators/base_generator'

module DrySerialization
  module Blueprinter
    class InstallGenerator < BaseGenerator
      source_root File.expand_path("../../../templates", __FILE__)

      def remove_other_supported_gems
        puts set_color('Removing other supported gems', :orange)
        run 'gem uninstall active_model_serializers'
        log_statement('ActiveModelSerializers')
        run 'gem uninstall fast_jsonapi'
        log_statement('FastJsonapi')
      end
      
      def install_blueprinter
        puts 'Installing Blueprinter...'
        run 'gem install blueprinter'
      end
     
      
      def include_helper
        puts 'Adding include statement to ApiController'
        insert_into_file('app/controllers/api_controller.rb',
                         "\n\tinclude DrySerialization::Blueprinter",
                         after: 'class ApiController < ActionController::API'
                         )
      end
      
    end
  end
end