class Roast < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :toggle_image_url, :thumbnail_image_url, :toggle_text, :description, presence: true

  def to_s
    name
  end

end
