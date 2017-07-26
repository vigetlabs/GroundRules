class Roast < ApplicationRecord
  extend SimplestPhoto::HasPhoto

  has_many :roast_brands

  has_photo :image, required: true

  acts_as_list

  validates :name, presence: true, uniqueness: true
  validates :description, :sub_description, presence: true

  def to_s
    name
  end

end
