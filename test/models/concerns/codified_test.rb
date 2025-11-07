# frozen_string_literal: true

module Concerns
  module CodifiedTest
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

    def test_be_codified
      assert_respond_to @record, :code
      assert @record.code.present?
    end

    #
    #
    # Callbacks
    # -------------------------------------------------------------------------------
    #
    #
    #
    #

    def test_should_ensure_code_on_create
      record = @record_class.new
      assert_nil record.code
      record.valid?
      assert record.code.present?
    end

    #
    #
    # Validations
    # -------------------------------------------------------------------------------
    #
    #
    #
    #

    def test_should_validate_presence_of_code
      @record.code = nil
      assert_not @record.valid?
      assert_includes @record.errors[:code], "can't be blank"
    end

    def test_should_validate_uniqueness_of_code
      duplicate_record = @record_class.new(code: @record.code)
      assert_not duplicate_record.valid?
      assert_includes duplicate_record.errors[:code], "has already been taken"
    end

    #
    #
    # Class methods
    # -------------------------------------------------------------------------------
    #
    #
    #
    #

    def test_should_generate_code
      code = @record_class.generate_code
      assert code.is_a?(String)
      assert_equal 11, code.length
    end
  end
end
