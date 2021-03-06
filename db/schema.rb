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

ActiveRecord::Schema.define(:version => 20120818015711) do

  create_table "pages", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "slug"
    t.text     "contents"
    t.datetime "visible_at"
    t.datetime "hidden_at"
    t.string   "state",      :default => "new", :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug"
  add_index "pages", ["state"], :name => "index_pages_on_state"
  add_index "pages", ["visible_at", "hidden_at"], :name => "index_pages_on_visible_at_and_hidden_at"

  create_table "roles", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string  "name",                           :null => false
    t.text    "description"
    t.string  "state",       :default => "new", :null => false
    t.boolean "hidden",      :default => true,  :null => false
  end

  add_index "tags", ["state"], :name => "index_tags_on_state"

  create_table "users", :force => true do |t|
    t.string   "email",                                  :null => false
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.string   "phone"
    t.string   "company"
    t.string   "address1"
    t.string   "address2"
    t.string   "locality"
    t.string   "region"
    t.string   "country"
    t.string   "postal_code"
    t.string   "time_zone"
    t.date     "birthday"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
