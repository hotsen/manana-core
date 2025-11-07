# frozen_string_literal: true

require "test_helper"

class ItemTest < ActiveSupport::TestCase
  #
  #
  # Shared Examples
  # -------------------------------------------------------------------------------
  #
  #
  #
  #

  include Concerns::FixturesTest
  include Concerns::CodifiedTest

  #
  #
  # Setup
  # -------------------------------------------------------------------------------
  #
  #
  #
  #

  def setup
    @record = items(:foo)
    @record_class = @record.class
  end

  #
  #
  # Associations
  # -------------------------------------------------------------------------------
  #
  #
  #
  #

  def test_should_belong_to_account
    assert_respond_to @record, :account
    assert_equal accounts(:bob), @record.account
  end

  #
  #
  # Validations
  # -------------------------------------------------------------------------------
  #
  #
  #
  #
  def test_should_validate_presence_of_name
    @record.name = nil
    assert_not @record.valid?
    assert_includes @record.errors[:name], "can't be blank"
  end

  def test_should_validate_presence_of_uuid
    @record.uuid = nil
    assert_not @record.valid?
    assert_includes @record.errors[:uuid], "can't be blank"
  end

  def test_should_validate_presence_of_mood
    @record.mood = nil
    assert_not @record.valid?
    assert_includes @record.errors[:mood], "can't be blank"
  end
end
