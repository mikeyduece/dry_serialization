#require 'spec_helper'
require 'dry_serialization/blueprinter'

RSpec.describe 'Blueprinter#serialized_resource' do
  it { should respond_to?(:serialized_resource) }
end