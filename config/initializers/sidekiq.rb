# frozen_string_literal: true

redis_url = ENV.fetch("REDIS_URL", "redis://localhost:6379").strip
redis_network_timeout = ENV.fetch("REDIS_NETWORK_TIMEOUT", "15").strip.to_i

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url, network_timeout: redis_network_timeout }
  config.average_scheduled_poll_interval = 5
  config.logger.level = Logger::INFO
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url, network_timeout: redis_network_timeout }
end

# Perform Sidekiq jobs immediately in development,
# so you don't have to run a separate process.
# You'll also benefit from code reloading.
if Rails.env.development? && Rails.root.join("config/sidekiq.yml").exist?
  # Add https://github.com/ibm-skills-network/portals/blob/master/glados/config/sidekiq.yml to repo for scheduling sidekiq jobs
  require "sidekiq/testing"
  Sidekiq::Testing.inline!
  # Start sidekiq scheduler
  if defined?(Rails::Server)
    schedule_yaml = ERB.new(File.read(Rails.root.join("config/sidekiq.yml"))).result
    Sidekiq.schedule = YAML.safe_load(schedule_yaml, permitted_classes: [Symbol])[:schedule]
    SidekiqScheduler::Scheduler.enabled = true
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end
