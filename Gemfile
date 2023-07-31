source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Core
gem "pg", "~> 1"
gem "rails", "~> 7"

# Views, JavaScript and assets
gem "heroicon", "~> 1"
gem "jbuilder", "~> 2"
gem "simple_form", "~> 5"
gem "sprockets-rails", "~> 3"
gem "tailwindcss-rails", "~> 2"
gem "turbo-rails", "~> 1"
gem "view_component", "~> 2"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4"
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3"

# Authentication and authorization
gem "devise", "~> 4"
gem "omniauth", "~> 2"
gem "omniauth-oauth2", "~> 1"
gem "omniauth-rails_csrf_protection", "~> 1"

# Jobs
gem "sidekiq", "~> 6"
gem "sidekiq-scheduler", "~> 4"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Other
gem "bootsnap", ">= 1", require: false
gem "config", "~> 2"
gem "inline_svg", "~> 1"
gem "puma", "~> 5"
gem "tzinfo-data", "~> 1"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails", "~> 1"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "byebug", "~> 11"
  # RSpec for testing
  gem "rspec-rails", "~> 5"
  # FactoryBot for creating model instances for tests
  gem "factory_bot_rails", "~> 6"
  # Faker for generating fake data for tests
  gem "faker", "~> 2"
  # Capybara for integration tests
  gem "capybara", "~> 3"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", "~> 4.2.0"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler", "~> 3.0.0"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring", "~> 4.1.0"

  # Rubocop github flavour
  gem "rubocop-github", "~> 0.17.0"
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false

  # ERB linting
  gem "erb_lint", "~> 0.3.1"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "webdrivers"

  # WithModel for temporarily creating ActiveRecord models during tests
  gem "with_model", "~> 2.1"
end
