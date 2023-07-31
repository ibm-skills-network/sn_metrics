class CreateSocialProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :social_providers do |t|
      t.integer "user_id", null: false
      t.text "email"
      t.text "sub", null: false
      t.text "provider"
      t.text "access_token"
      t.text "refresh_token"
      t.text "id_token"
      t.string "profile_url"
      t.boolean "show_on_profile", default: true
      t.index ["provider", "sub"], name: "social_providers_provider_sub_key", unique: true
      t.timestamps
    end
  end
end
