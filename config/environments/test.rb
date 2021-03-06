# Settings specified here will take precedence over those in config/environment.rb

require 'pp'

require 'test/unit'
require 'mocha/setup'

# The test environment is used exclusively to run your application's
# test suite.  You never need to work with it otherwise.  Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs.  Don't rely on the data there!
config.cache_classes = true

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
config.action_view.cache_template_loading            = true

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell Action Mailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test

config.action_controller.session = { :key => "_test_session", :secret => "218d878f47b437169e7de9975d2e1286" }

if ENV['COVERAGE']
  require 'simplecov'
  FileUtils.rm_rf(Rails.root + 'public/coverage')
  SimpleCov.start 'rails' do
    add_filter  '/vendor/bundle/'
    coverage_dir 'public/coverage'
  end
end
