# frozen_string_literal: false

module Human
  extend ActiveSupport::Concern

  included do
    #
    # Class methods
    # ---------------------------------------------------------------------------
    #
    #
    #
    #

    def self.human_name(count = 1)
      model_name.human(count:)
    end

    def self.human_names(count = 0)
      model_name.human(count:)
    end
  end
end
