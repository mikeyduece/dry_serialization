require 'generators/base_generator'

module DrySerialization
  module JsonapiSerializer
    class InstallGenerator < BaseGenerator
      source_root File.expand_path("../../../templates", __FILE__)
      
      # Add blueprinter gem to gemfile after dry_serialization declaration and bundles the newly declared gem
      def install_jsonapi_serializer
        remove_other_supported_gems(SERIALIZERS[:blueprinter], SERIALIZERS[:ams])
        
        puts "Installing #{SERIALIZERS[:jsonapi_serializer]}..."
        insert_into_file('Gemfile',
                         "\ngem 'jsonapi_serializer'",
                         after: "gem 'dry_serialization'")
        run 'bundle install'
        
        helper_include(SERIALIZERS[:jsonapi_serializer])
      end
    
    end
  end
end