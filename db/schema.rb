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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151012161209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "greeneries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plant_id"
    t.datetime "created_at",                                                                                          null: false
    t.datetime "updated_at",                                                                                          null: false
    t.string   "message",       default: "Hi! Your plants love you. Don't forget to water them today. xo greenhaus."
    t.integer  "last_sent"
    t.boolean  "text_reminder"
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.string   "science"
    t.string   "description"
    t.integer  "moisture"
    t.string   "sunlight"
    t.text     "bio"
    t.string   "img_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "token"
    t.datetime "created_at",                                                                                                          null: false
    t.datetime "updated_at",                                                                                                          null: false
    t.string   "pic_url",         default: "https://s-media-cache-ak0.pinimg.com/736x/29/c6/e0/29c6e032e266ab009f2a1f884df0e331.jpg"
    t.string   "phone"
    t.boolean  "text_reminder"
  end

end
