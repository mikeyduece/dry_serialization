require 'dry_serialization/blueprinter'

describe DrySerialization::Blueprinter do
  it { should respond_to?(:serialized_resource) }
end