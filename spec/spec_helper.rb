RSpec.configure do |config|
  config.before(:all) do
    DrySerialization.configure do |c|
      c.serializer = :fast_jsonapi
    end
    
  end
end