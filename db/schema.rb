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

ActiveRecord::Schema.define(version: 20170403154627) do

  create_table "expenditure_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_expenditure_categories_on_User_id"
  end

  create_table "expenditure_category_joins", force: :cascade do |t|
    t.integer  "expenditure_id"
    t.integer  "expenditure_category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["expenditure_category_id"], name: "index_expenditure_category_joins_on_expenditure_category_id"
    t.index ["expenditure_id"], name: "index_expenditure_category_joins_on_expenditure_id"
  end

  create_table "expenditures", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "User_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "expenditure_category_id"
    t.string   "category"
    t.datetime "issued_at"
    t.index ["User_id"], name: "index_expenditures_on_User_id"
    t.index ["expenditure_category_id"], name: "index_expenditures_on_expenditure_category_id"
  end

  create_table "income_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_income_categories_on_User_id"
  end

  create_table "income_category_joins", force: :cascade do |t|
    t.integer  "income_id"
    t.integer  "income_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["income_category_id"], name: "index_income_category_joins_on_income_category_id"
    t.index ["income_id"], name: "index_income_category_joins_on_income_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "User_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "income_category_id"
    t.string   "category"
    t.datetime "issued_at"
    t.index ["User_id"], name: "index_incomes_on_User_id"
    t.index ["income_category_id"], name: "index_incomes_on_income_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
