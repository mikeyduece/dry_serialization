require 'generators/base_generator'

module DrySerialization
  module Blueprinter
    class InstallGenerator < BaseGenerator
      source_root File.expand_path("../../../templates", __FILE__)

      def install_blueprinter
        remove_other_supported_gems('ActiveModelSerializers', 'Fast_Jsonapi')
        puts 'Installing Blueprinter...'
        run 'gem install blueprinter'
      end


      def helper_include
        puts 'Adding include statement to ApiController'
        insert_into_file('app/controllers/api_controller.rb',
                         "\n\tinclude DrySerialization::Blueprinter",
                         after: 'class ApiController < ActionController::API'
        )
      end
     
    end
  end
end