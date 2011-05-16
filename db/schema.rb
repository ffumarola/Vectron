# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110516031641) do

  create_table "administrators", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "zip_code"
    t.string   "address"
    t.string   "phone"
    t.string   "operating_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumer_event_types", :force => true do |t|
    t.integer  "consumer_id"
    t.integer  "event_type_id"
    t.integer  "user_value"
    t.integer  "system_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumers", :force => true do |t|
    t.string   "zip_code"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_contents", :force => true do |t|
    t.integer  "from_id"
    t.string   "subject"
    t.text     "body"
    t.integer  "message_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_recipients", :force => true do |t|
    t.integer  "message_content_id"
    t.integer  "recipient_id"
    t.boolean  "unread"
    t.boolean  "archive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "relationship_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "master_id"
    t.integer  "slave_id"
    t.integer  "value"
    t.integer  "relationship_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "voucher_offers", :force => true do |t|
    t.integer  "voucher_id"
    t.integer  "consumer_id"
    t.boolean  "accepted"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vouchers", :force => true do |t|
    t.integer  "business_id"
    t.integer  "event_type_id"
    t.string   "name"
    t.string   "description"
    t.datetime "event_time"
    t.integer  "offer_lifespan_minutes"
    t.integer  "max_offers"
    t.integer  "voucher_price_cents"
    t.integer  "full_value_cents"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end