#require 'spec_helper'
require 'dry_serialization/blueprinter'

RSpec.describe 'Blueprinter#serialized_resource' do
  before(:all) do
    DrySerialization.configure do |c|
      c.serializer = :fast_jsonapi
    end
  end
  it { should respond_to?(:serialized_resource) }
end