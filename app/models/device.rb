class Device < ApplicationRecord
  extend SimplestPhoto::HasPhoto

  has_many :device_problems
  accepts_nested_attributes_for :device_problems, :allow_destroy => true

  has_photo :image, required: true

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end

end
