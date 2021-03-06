require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GroundRules
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.assets.paths << "#{ config.root }/node_modules"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.exceptions_app = self.routes

    if ['development', 'test'].exclude? Rails.env
      config.browserify_rails.node_env = 'production'
    end
  end
end
