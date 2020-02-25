require 'generators/base_generator'

module DrySerialization
  module Blueprinter
    class InstallGenerator < BaseGenerator
      source_root File.expand_path("../../../templates", __FILE__)
      
      # Add blueprinter gem to gemfile after dry_serialization declaration and bundles the newly declared gem
      def install_blueprinter
        remove_other_supported_gems
        puts 'Installing Blueprinter...'
        insert_into_file('Gemfile',
                         "\ngem 'blueprinter'",
                         after: "gem 'dry_serialization', source: 'https://gem.fury.io/mikeyduece-gems/'")
        run 'bundle install'
      end


      def helper_include
        copy_api_controller
        gsub_file(API_CONTROLLER_PATH, /^\t*(include DrySerialization::.*)\n/, '')
        puts 'Adding include statement to ApiController'
        insert_into_file(API_CONTROLLER_PATH,
                         "\n\tinclude DrySerialization::Blueprinter",
                         after: 'class ApiController < ActionController::API'
        )
      end
     
    end
  end
end