class Account < ApplicationRecord
  #
  #
  # Concerns
  # --------------------------------------------------------------------------------------
  #
  #
  #

  #
  #
  # Plugins
  # --------------------------------------------------------------------------------------
  #
  #
  #


  #
  #
  # Associations
  # --------------------------------------------------------------------------------------
  #
  #
  #

  #
  #
  # Scopes
  # --------------------------------------------------------------------------------------
  #
  #
  #


  #
  #
  # Callbacks
  # --------------------------------------------------------------------------------------
  #
  #
  #

  before_validation :ensure_uuid, on: :create

  #
  #
  # Validations
  # --------------------------------------------------------------------------------------
  #
  #
  #

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
  validates :uuid, presence: true, uniqueness: true
  validates :mood, presence: true

  #
  #
  # Stores
  # --------------------------------------------------------------------------------------
  #
  #
  #


  #
  #
  # Instance Methods
  # --------------------------------------------------------------------------------------
  #
  #
  #


  #
  #
  # Class Methods
  # --------------------------------------------------------------------------------------
  #
  #
  #


  #
  #
  # Private Methods
  # --------------------------------------------------------------------------------------
  #
  #
  #

  private

  def ensure_uuid
    self.uuid ||= SecureRandom.uuid
  end

  def ensure_mood
    self.mood ||= "none"
  end

  def ensure_code
    self.code ||= name.parameterize.underscore
  end
end
