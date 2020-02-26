require 'generators/base_generator'

module DrySerialization
  module Ams
    class InstallGenerator < BaseGenerator
      source_root File.expand_path("../../../templates", __FILE__)
      
      # Add blueprinter gem to gemfile after dry_serialization declaration and bundles the newly declared gem
      def install_ams
        remove_other_supported_gems(SERIALIZERS[:blueprinter], 'FastJsonapi')
        
        puts set_color("Installing #{SERIALIZERS[:ams]}...", :cyan)
        insert_into_file('Gemfile',
                         "\ngem 'active_model_serializers'",
                         after: "gem 'dry_serialization', source: 'https://gem.fury.io/mikeyduece-gems/'")
        run 'bundle install'
        
        helper_include(SERIALIZERS[:ams])
      end
      
    end
  end
end