require 'generators/base_generator'

module DrySerialization
  module FastJsonapi
    class InstallGenerator < BaseGenerator
      source_root File.expand_path("../../../templates", __FILE__)
      
      # Add blueprinter gem to gemfile after dry_serialization declaration and bundles the newly declared gem
      def install_blueprinter
        remove_other_supported_gems(SERIALIZERS[:blueprinter], SERIALIZERS[:ams])
        
        puts "Installing #{SERIALIZERS[:blueprinter]}..."
        insert_into_file('Gemfile',
                         "\ngem 'fast_jsonapi'",
                         after: "gem 'dry_serialization', source: 'https://gem.fury.io/mikeyduece-gems/'")
        run 'bundle install'
        
        helper_include(SERIALIZERS[:fast_jsonapi])
      end
    
    end
  end
end