class Device < ApplicationRecord

  has_many :device_problems
  accepts_nested_attributes_for :device_problems, :allow_destroy => true

  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true

  def to_s
    name
  end

end
