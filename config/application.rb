require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

config.i18n.default_locale = ja

module ChatSpace
  class Application < Rails::Application
    config.generators do |g|
      g.helper false
      g.test_framework false
      g.coffee false
      g.assets false
      g.yml false
    end

  end
end
