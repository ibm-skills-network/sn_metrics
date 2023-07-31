if Rails.env.development?
  Settings.add_source!(Rails.root.join("config/settings/development.local.yaml.dec").to_s)
  Settings.reload!
end
