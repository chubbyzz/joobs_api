require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module DbStore
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.generators {|g| g.test_framework :rspec }

    Rails.application.configure do
      config.action_mailer.default_url_options = { host: 'localhost', port: 3001 }
      config.action_mailer.delivery_method = :smtp
      config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 :headers => :any,
                 :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
                 :methods => [:get, :post, :delete, :put, :options]
      end
    end
  end
end
