require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AlarmClockRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # We need a "default" playlist in our DB at all times, so let's throw that in here
    config.after_initialize do
    	default_exists = Playlist.all.exists?(name: 'default')
    	Rails.logger.info "Default playlist exists: #{default_exists}"

    	unless default_exists
    		Rails.logger.info 'Creating default playlist...'
    		Playlist.create!(name: 'default')
    	end
    end
  end
end
