# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_22_142446) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "portals", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "domain"
    t.string "managers", array: true
    t.integer "total_learners"
    t.jsonb "learners_data"
    t.integer "total_enrollments"
    t.jsonb "enrollments_data"
    t.integer "total_completions"
    t.jsonb "completions_data"
    t.integer "total_certificates"
    t.jsonb "certificates_data"
    t.datetime "last_login"
    t.datetime "last_join"
    t.integer "installed_catalog_items"
    t.integer "installed_non_catalog_items"
    t.integer "outdated_catalog_items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["managers"], name: "index_portals_on_managers", using: :gin
    t.index ["name"], name: "index_portals_on_name", unique: true
    t.index ["slug"], name: "index_portals_on_slug", unique: true
  end

  create_table "social_providers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "email"
    t.text "sub", null: false
    t.text "provider"
    t.text "access_token"
    t.text "refresh_token"
    t.text "id_token"
    t.string "profile_url"
    t.boolean "show_on_profile", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "sub"], name: "social_providers_provider_sub_key", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
