class DeviceProblem < ApplicationRecord

  belongs_to :device

  validates :statement, :content, :device_id, presence: true

  validate :statement_within_allowed_length, if: :statement

  def statement_within_allowed_length
    if statement.length > 35
      errors.add(:statement, "must contain less than 35 characters")
    end
  end

  def to_s
    statement
  end

end
