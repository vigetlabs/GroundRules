class DeviceProblem < ApplicationRecord

  belongs_to :device

  validates :statement, :content, :device_id, presence: true
  validates :statement, length: { maximum: 35 }

  def to_s
    statement
  end

end
