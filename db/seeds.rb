# frozen_string_literal: true

ASYNC = false

if Rails.env.development?
  #
  #
  # Load Fixtures
  # -------------------------------------------------------------------------------
  #
  #
  #
  #

  Rake::Task['db:fixtures:load'].execute
end
