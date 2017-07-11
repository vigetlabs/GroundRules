class RoastBrand < ApplicationRecord

  belongs_to :roast

  validates :brand_name, :roast_name, :image_url, :roast_id, presence: true

  def to_s
    roast_name
  end

end
