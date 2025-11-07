# frozen_string_literal: true

#
#
# Simplecov
# ---------------------------------------------------------------------------------
#
#
#
#

if ENV["COVERAGE"] == "true"
  require "simplecov"

  # TODO: How to include namespaced classes ?
  SimpleCov.start do
    # https://github.com/simplecov-ruby/simplecov#defining-custom-filters
    add_filter "config/initializers/"
  end
end

#
#
# Rails Defaults
# ---------------------------------------------------------------------------------
#
#
#
#

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

# require shared examples
Dir[File.dirname(__FILE__) + "/models/concerns/**/*.rb"].each { |file| require file }
Dir[File.dirname(__FILE__) + "/controllers/concerns/**/*.rb"].each { |file| require file }

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
  end
end

# Enable :locale scope set automatically
Rails.application.routes.default_url_options[:locale] = I18n.locale
