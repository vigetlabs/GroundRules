class DeviceProblem < ApplicationRecord

  belongs_to :device

  validates :statement, :content, :device_id, presence: true

  def to_s
    statement
  end

end
