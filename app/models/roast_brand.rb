class RoastBrand < ApplicationRecord
  extend SimplestPhoto::HasPhoto

  belongs_to :roast

  has_photo :image, required: true

  acts_as_list

  validates :brand_name, :roast_name, :roast_id, presence: true

  def to_s
    roast_name
  end

end
