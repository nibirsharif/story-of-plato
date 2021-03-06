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

ActiveRecord::Schema.define(version: 20180828040158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boards", ["project_id"], name: "index_boards_on_project_id", using: :btree

  create_table "card_references", force: :cascade do |t|
    t.integer  "card_referrer_id"
    t.integer  "card_referent_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string   "title",       limit: 288
    t.string   "description"
    t.string   "color"
    t.integer  "user_id"
    t.integer  "board_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "cards", ["board_id"], name: "index_cards_on_board_id", using: :btree
  add_index "cards", ["user_id"], name: "index_cards_on_user_id", using: :btree

  create_table "organization_subscriptions", force: :cascade do |t|
    t.integer  "status"
    t.integer  "organization_id"
    t.integer  "subscription_plan_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "organization_subscriptions", ["organization_id"], name: "index_organization_subscriptions_on_organization_id", using: :btree
  add_index "organization_subscriptions", ["subscription_plan_id"], name: "index_organization_subscriptions_on_subscription_plan_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pricing_plans", force: :cascade do |t|
    t.string   "name"
    t.string   "currency",          default: "USD"
    t.integer  "monthly_price"
    t.integer  "annual_price"
    t.integer  "additional_charge"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "projects", ["organization_id"], name: "index_projects_on_organization_id", using: :btree

  create_table "projects_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id", using: :btree
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id", using: :btree

  create_table "subscription_plans", force: :cascade do |t|
    t.integer  "plan_type"
    t.integer  "subscription_type"
    t.integer  "monthly_cap"
    t.integer  "pricing_plan_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "subscription_plans", ["pricing_plan_id"], name: "index_subscription_plans_on_pricing_plan_id", using: :btree

  create_table "task_lists", force: :cascade do |t|
    t.string   "color"
    t.integer  "card_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "completed",  default: false
  end

  add_index "task_lists", ["card_id"], name: "index_task_lists_on_card_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "state"
    t.string   "description"
    t.integer  "task_list_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tasks", ["task_list_id"], name: "index_tasks_on_task_list_id", using: :btree

  create_table "user_subscriptions", force: :cascade do |t|
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "subscription_plan_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_subscriptions", ["subscription_plan_id"], name: "index_user_subscriptions_on_subscription_plan_id", using: :btree
  add_index "user_subscriptions", ["user_id"], name: "index_user_subscriptions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree

  add_foreign_key "boards", "projects"
  add_foreign_key "cards", "boards"
  add_foreign_key "cards", "users"
  add_foreign_key "organization_subscriptions", "organizations"
  add_foreign_key "organization_subscriptions", "subscription_plans"
  add_foreign_key "projects", "organizations"
  add_foreign_key "projects_users", "projects"
  add_foreign_key "projects_users", "users"
  add_foreign_key "subscription_plans", "pricing_plans"
  add_foreign_key "task_lists", "cards"
  add_foreign_key "tasks", "task_lists"
  add_foreign_key "user_subscriptions", "subscription_plans"
  add_foreign_key "user_subscriptions", "users"
  add_foreign_key "users", "organizations"
end
