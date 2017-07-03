class Device < ApplicationRecord

  has_many :device_problems

  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true

  def to_s
    name
  end

end
