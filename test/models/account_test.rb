# frozen_string_literal: true

require "test_helper"

class AccountTest < ActiveSupport::TestCase
  #
  #
  # Shared Examples
  # -------------------------------------------------------------------------------
  #
  #
  #
  #

  include Concerns::FixturesTest

  #
  #
  # Setup
  # -------------------------------------------------------------------------------
  #
  #
  #
  #

  def setup
    @record = accounts(:bob)
    @record_class = @record.class
  end

  #
  #
  # Devise
  # -------------------------------------------------------------------------------
  #
  #
  #
  #

  #
  #
  # Attachments
  # -------------------------------------------------------------------------------
  #
  #
  #
  #
end
