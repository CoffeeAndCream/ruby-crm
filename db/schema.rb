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

ActiveRecord::Schema.define(version: 201702111755526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "lead_id"
    t.text     "comment",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_comments_on_lead_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.string   "company_email"
    t.string   "company_email_password"
    t.string   "company_phone"
    t.string   "smtp_address"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lead_id"
    t.string   "title"
    t.datetime "start"
    t.datetime "ends"
    t.string   "color",       default: "#428bca"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["lead_id"], name: "index_events_on_lead_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "job_sites", force: :cascade do |t|
    t.integer  "lead_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_job_sites_on_lead_id", using: :btree
  end

  create_table "leads", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name",                                                null: false
    t.string   "last_name",                                                 null: false
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "services",                                                               array: true
    t.datetime "visit_date"
    t.datetime "created_at",                                                null: false
    t.string   "source"
    t.decimal  "contract_total",   precision: 10, scale: 2, default: "0.0"
    t.boolean  "begin_project",                             default: false
    t.boolean  "finished_project",                          default: false
    t.boolean  "contacted",                                 default: false
    t.boolean  "closed",                                    default: false
    t.boolean  "customer",                                  default: false
    t.boolean  "send_thank_you",                            default: false
    t.datetime "updated_at",                                                null: false
    t.index ["user_id"], name: "index_leads_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "lead_id"
    t.string   "payment_type"
    t.decimal  "amount",       precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.index ["lead_id"], name: "index_payments_on_lead_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "lead_id"
    t.string   "image_uid"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_photos_on_lead_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "lead_id"
    t.datetime "start_date",                  null: false
    t.datetime "finish_date",                 null: false
    t.boolean  "finished",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["lead_id"], name: "index_projects_on_lead_id", using: :btree
  end

  create_table "service_orders", force: :cascade do |t|
    t.integer  "lead_id"
    t.string   "name"
    t.decimal  "cost"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_service_orders_on_lead_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "color",      default: "#428bca"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "source_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "details"
    t.boolean  "completed",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["project_id"], name: "index_tasks_on_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                           default: "",     null: false
    t.string   "encrypted_password",                              default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.decimal  "sales",                  precision: 10, scale: 2, default: "0.0",  null: false
    t.string   "color",                                           default: "blue"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "leads"
  add_foreign_key "events", "leads"
  add_foreign_key "job_sites", "leads"
  add_foreign_key "payments", "leads"
  add_foreign_key "photos", "leads"
  add_foreign_key "projects", "leads"
  add_foreign_key "service_orders", "leads"
  add_foreign_key "tasks", "projects"
end
