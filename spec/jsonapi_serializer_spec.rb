require 'spec_helper'
require 'fast_jsonapi'
require 'dry_serialization/jsonapi_serializer'

RSpec.describe 'JsonapiSerializer#serialized_resource' do
  let(:user) { create(:user) }
  let(:users) { create_list(:user, 3) }
  
  class TestCase < ActiveRecord::Base
    include DrySerialization::JsonapiSerializer
  end
  
  class UserSerializer
    include FastJsonapi::ObjectSerializer
    set_type :user
    attributes :first_name, :last_name
  end
  
  let(:single_return) { TestCase.new.serialized_resource(user, UserSerializer) }
  let(:collection_return) { TestCase.new.serialized_resource(users, UserSerializer) }
  
  
  it { should respond_to?(:serialized_resource) }

  it 'should serialize singe return' do
    json = JSON.parse(single_return.serialized_json)
    
    expect(json['data']).to be_a_kind_of(Hash)
    expect(json['data']['type']).to eq('user')
    expect(json['data']['attributes'].keys).to include('first_name' && 'last_name')
  end

  it 'should serialize collections' do
    json = JSON.parse(collection_return.serialized_json)

    expect(json['data']).to be_a_kind_of(Array)
    expect(json['data'].count).to eq(3)
    expect(json['data'].first['type']).to eq('user')
    expect(json['data'].first['attributes'].keys).to include('first_name' && 'last_name')
  end
end