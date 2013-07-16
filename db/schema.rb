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

ActiveRecord::Schema.define(:version => 20130706055054) do

  create_table "adtadmin_accountabilityagents", :force => true do |t|
    t.integer  "post_id"
    t.integer  "agentprofile_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "adtadmin_agentprofiles", :force => true do |t|
    t.integer  "region_id"
    t.boolean  "isactive",    :default => false
    t.boolean  "isdelete",    :default => false
    t.string   "name"
    t.string   "phone"
    t.string   "adress"
    t.text     "description"
    t.string   "photourl"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "adtadmin_categories", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.boolean  "isactive",     :default => false
    t.boolean  "isdelete",     :default => false
    t.integer  "type_id"
    t.string   "private_name"
    t.string   "full_name"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "adtadmin_images", :force => true do |t|
    t.integer  "post_id"
    t.string   "url"
    t.integer  "order"
    t.integer  "purpose_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "adtadmin_partners", :force => true do |t|
    t.string   "name"
    t.string   "aliasname"
    t.text     "description"
    t.boolean  "isactive",    :default => false
    t.boolean  "isdelete",    :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "adtadmin_posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "region_id"
    t.integer  "category_id"
    t.string   "altname"
    t.string   "title"
    t.text     "text"
    t.string   "contact"
    t.string   "tags"
    t.float    "price"
    t.boolean  "isactive",          :default => false
    t.boolean  "isdelete",          :default => false
    t.boolean  "ontop",             :default => false
    t.string   "imageurl"
    t.integer  "partner_id"
    t.string   "district"
    t.string   "space"
    t.string   "floor"
    t.string   "material"
    t.string   "plan"
    t.string   "year"
    t.string   "conditionbuilding"
    t.string   "apartmentstate"
    t.boolean  "balcony",           :default => false
    t.boolean  "phone",             :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "adtadmin_regions", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.boolean  "isdelete",   :default => false
    t.boolean  "isactive",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "order"
  end

  create_table "adtadmin_types", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.boolean  "isactive",   :default => false
    t.boolean  "isdelete",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "news_lists", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "short_text"
    t.text     "text"
    t.string   "img_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "isdelete"
    t.boolean  "isactive"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "typereview_id"
    t.string   "name"
    t.string   "phone"
    t.string   "adress"
    t.text     "description"
    t.integer  "post_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "stats", :force => true do |t|
    t.integer  "post_id"
    t.integer  "visittype"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "phone"
    t.integer  "region_id"
    t.string   "role",                   :default => "user"
    t.float    "money",                  :default => 100000.0
    t.boolean  "isusetoken",             :default => false
    t.string   "token"
    t.datetime "create_token_at"
    t.datetime "expire_token_at"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
