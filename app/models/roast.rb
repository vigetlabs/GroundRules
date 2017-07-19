class Roast < ApplicationRecord
  extend SimplestPhoto::HasPhoto

  has_many :roast_brands

  has_photo :toggle_image, required: true

  validates :name, presence: true, uniqueness: true
  validates :toggle_image_url, :toggle_text, :description, presence: true

  def to_s
    name
  end

end
