require 'spec_helper'
require 'active_model_serializers'
require 'dry_serialization/active_model_serializers'

RSpec.describe 'ActiveModelSerializers#serialized_resource' do
  let(:user) { create(:user) }
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email
  end
  
  class TestCase < ActiveRecord::Base
    include DrySerialization::ActiveModelSerializers
  end
  
  subject { TestCase.new }
  
  it { should respond_to?(:serialized_resource) }
  
  it 'should serialize single return' do
    serialized_user = subject.serialized_resource(user, UserSerializer)
    require 'pry'; binding.pry
    expect(serialized_user)
  end
end