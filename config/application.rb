require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Skyline
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.enabled = true
    config.assets.paths << Rails.root.join('app/assets/fonts')

    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.secret_key_base = '21b26fdc56f848d2cfa43fa4ecf2ac1c4a122591129d683cd6a6dfd5fa7fa28ea039cfddc5771e48e90ba068c65f669ef96a31a0d91f27aa31ec9b4a3dd62cf8'
  end
end
