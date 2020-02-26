#require 'spec_helper'
require 'dry_serialization/active_model_serializers'

RSpec.describe 'ActiveModelSerializers#serialized_resource' do
  it { should respond_to?(:serialized_resource) }
end