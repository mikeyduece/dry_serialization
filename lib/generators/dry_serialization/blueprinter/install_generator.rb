require 'rails/generators/base'

module DrySerialization
  module Blueprinter
    class InstallGenerator < Rails::Generators::Base
      
      def install_blueprinter
        invoke 'gem install blueprinter'
      end
      
      def include_helper
        insert_into_file('app/controllers/api_controller.rb',
                         "\n\tinclude DrySerialization::Blueprinter",
                         after: 'class ApiController < ActionController::API'
                         )
      end
    end
  end
end