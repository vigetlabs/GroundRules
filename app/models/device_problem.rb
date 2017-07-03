class DeviceProblem < ApplicationRecord

  belongs_to :device

  validates :problem, :content, :device_id, presence: true

  def to_s
    problem
  end

end
