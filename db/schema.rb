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

ActiveRecord::Schema.define(version: 4) do

  create_table "emails", force: :cascade do |t|
    t.string "login"
    t.string "password"
  end

  create_table "proxies", force: :cascade do |t|
    t.string "ip_address"
    t.integer "port"
  end

  create_table "proxies_accounts", force: :cascade do |t|
    t.integer "proxy_id"
    t.integer "rsaccount_id"
  end

  create_table "rsaccounts", force: :cascade do |t|
    t.string "login"
    t.string "password"
    t.string "username"
    t.boolean "banned"
    t.integer "email_id"
  end

end
