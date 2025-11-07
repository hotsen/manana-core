# frozen_string_literal: false

module Codified
  extend ActiveSupport::Concern

  included do
    #
    #
    # Validations
    # ---------------------------------------------------------------------------
    #
    #
    #
    #

    validates :code, presence: true, uniqueness: true

    #
    #
    # Callbacks
    # ---------------------------------------------------------------------------
    #
    #
    #
    #

    before_validation :ensure_code, on: :create

    #
    #
    # Class methods
    # ---------------------------------------------------------------------------
    #
    #
    #
    #

    def self.generate_code
      SecureRandom.urlsafe_base64(8)
    end

    #
    #
    # Private methods
    # ---------------------------------------------------------------------------
    #
    #
    #
    #

    def ensure_code
      self.code ||= self.class.generate_code
    end
  end
end
