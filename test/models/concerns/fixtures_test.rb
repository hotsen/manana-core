# frozen_string_literal: true

module Concerns
  module FixturesTest
    #
    #
    # Fixtures
    # -------------------------------------------------------------------------------
    #
    #
    #
    #

    def test_should_have_record_to_test
      assert @record.present?
      assert @record.is_a?(@record_class)
      assert @record.valid?
    end

    def test_should_have_valid_fixtures
      assert @record_class.any?

      @record_class.find_each do |record|
        assert record.valid?, "#{@record_class.name} #{record.id} is invalid: #{record.errors.full_messages.to_sentence}"
      end
    end
  end
end
