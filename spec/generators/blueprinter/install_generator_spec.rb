require 'spec_helper'
require 'generator_spec'
require 'generators/dry_serialization/blueprinter/install_generator'

RSpec.describe DrySerialization::Blueprinter::InstallGenerator, type: :generator do
  let(:file) { 'app/controllers/api_controller.rb' }
  
  it 'installs blueprinter' do
    run_generator
    expect(File.exists?('app/controllers/api_controller.rb')).to be(true)
    expect(File.read(file)).to include('include DrySerialization::Blueprinter')
  end
  
end