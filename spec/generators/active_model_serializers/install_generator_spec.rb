require 'spec_helper'
require 'generator_spec'
require 'generators/dry_serialization/ams/install_generator'

RSpec.describe DrySerialization::Ams::InstallGenerator, type: :generator do
  after(:each) do
    FileUtils.rm_rf('app')
  end
  
  let(:file) { 'app/controllers/api_controller.rb' }
  
  it 'installs blueprinter' do
    run_generator
    
    expect(File.exists?('app/controllers/api_controller.rb')).to be(true)
    expect(File.read(file)).to include('include DrySerialization::ActiveModelSerializers')
  end
end