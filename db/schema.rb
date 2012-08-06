# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120806164009) do

  create_table "horses", :force => true do |t|
    t.string   "name"
    t.string   "foreign_bred_code"
    t.integer  "bred_location_id"
    t.string   "state_bred_code"
    t.integer  "state_bred_location_id"
    t.integer  "year_of_birth"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "horses", ["name"], :name => "index_horses_on_name"

  create_table "movies", :force => true do |t|
    t.string   "name"
    t.float    "opening_weekend"
    t.float    "percent_of_total"
    t.float    "total_gross"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "race_id"
    t.integer  "post_position"
    t.string   "program_number"
    t.boolean  "is_scratched"
    t.boolean  "is_tongue_tied"
  end

  create_table "oauth_access_grants", :force => true do |t|
    t.integer  "resource_owner_id", :null => false
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.integer  "expires_in",        :null => false
    t.string   "redirect_uri",      :null => false
    t.datetime "created_at",        :null => false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], :name => "index_oauth_access_grants_on_token", :unique => true

  create_table "oauth_access_tokens", :force => true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        :null => false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], :name => "index_oauth_access_tokens_on_refresh_token", :unique => true
  add_index "oauth_access_tokens", ["resource_owner_id"], :name => "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], :name => "index_oauth_access_tokens_on_token", :unique => true

  create_table "oauth_applications", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "uid",          :null => false
    t.string   "secret",       :null => false
    t.string   "redirect_uri", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "oauth_applications", ["uid"], :name => "index_oauth_applications_on_uid", :unique => true

  create_table "races", :force => true do |t|
    t.integer  "track_id"
    t.string   "track_code"
    t.date     "date"
    t.integer  "race_number"
    t.string   "day_evening_code"
    t.boolean  "is_day"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "races", ["date"], :name => "index_races_on_date"
  add_index "races", ["race_number"], :name => "index_races_on_race_number"
  add_index "races", ["track_code"], :name => "index_races_on_track_code"
  add_index "races", ["track_id"], :name => "index_races_on_track_id"

  create_table "starts", :force => true do |t|
    t.integer  "race_id"
    t.integer  "horse_id"
    t.integer  "trainer_id"
    t.integer  "jockey_id"
    t.integer  "owner_id"
    t.integer  "post_position"
    t.string   "program_number"
    t.boolean  "is_scratched"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "is_tongue_tied"
  end

  add_index "starts", ["horse_id"], :name => "index_starts_on_horse_id"
  add_index "starts", ["jockey_id"], :name => "index_starts_on_jockey_id"
  add_index "starts", ["owner_id"], :name => "index_starts_on_owner_id"
  add_index "starts", ["race_id"], :name => "index_starts_on_race_id"
  add_index "starts", ["trainer_id"], :name => "index_starts_on_trainer_id"

  create_table "tracks", :force => true do |t|
    t.string   "track_code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :limit => 128, :null => false
    t.string   "an_code",         :limit => 50,  :null => false
    t.string   "initials",        :limit => 50,  :null => false
    t.integer  "state_id",                       :null => false
    t.integer  "category_id",                    :null => false
    t.integer  "server_id"
    t.boolean  "is_customer"
    t.boolean  "show"
    t.string   "description",     :limit => 512
    t.integer  "display_order"
    t.datetime "retired_date"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "roles_mask"
  end

end
