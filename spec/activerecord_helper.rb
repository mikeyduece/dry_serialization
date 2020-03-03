require 'active_record'
require 'factories/model_factories.rb'
require 'dry_serialization/active_model_serializers'

ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: ":memory:",
)

class User < ActiveRecord::Base
end

class TestCase < ActiveRecord::Base
end

ActiveRecord::Schema.define(version: 20181116094243) do
  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "active"
  end
  
  create_table "test_cases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  
end

ActiveRecord::Migration.maintain_test_schema!