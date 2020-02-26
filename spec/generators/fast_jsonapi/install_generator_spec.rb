require 'spec_helper'
require 'generator_spec'
require 'generators/dry_serialization/fast_jsonapi/install_generator'

RSpec.describe DrySerialization::FastJsonapi::InstallGenerator, type: :generator do
  let(:file) { 'app/controllers/api_controller.rb' }
  
  it 'installs fast_jsonapi' do
    run_generator
    expect(File.exists?('app/controllers/api_controller.rb')).to be(true)
    expect(File.read(file)).to include('include DrySerialization::FastJsonapi')
  end

end