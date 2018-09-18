require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StudiumPlaner
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = "Europe/Berlin"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #
    config.paperclip_defaults = {
        :storage => :s3,
        :s3_credentials => {
            :access_key_id     => Rails.application.credentials.dig(:aws,:access_key_id),
            :secret_access_key => Rails.application.credentials.dig(:aws, :secret_access_key)
        },
        :s3_region                => 'eu-west-1',
        :bucket => 'a9s-railsvorlesung',
        :path  => "home/railsvorlesung16/:basename.:extension",
        :s3_protocol => 'https',
        :s3_host_name      => "s3-eu-west-1.amazonaws.com"
    }
  end
end
