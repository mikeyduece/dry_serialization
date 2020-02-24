require 'spec_helper'
require 'dry_serialization/blueprinter'

describe 'Blueprinter#serialized_resource' do
  it { should respond_to?(:serialized_resource) }
end