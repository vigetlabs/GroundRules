require 'rails_helper'

RSpec.describe RoastBrand, type: :model do

  it { should belong_to(:roast) }

  let!(:image) do
    Photo.create(name: 'Roast Image', image: File.open(Rails.root.join('assets/images/roast.jpg')))
  end

  let!(:roast) do
    Roast.create(
      name: 'Fake Roast Name',
      image: image,
      description: 'This is fake description',
      sub_description: 'This is a fake sub description'
    )
  end

  let!(:image) do
    Photo.create(name: 'Device Image', image: File.open(Rails.root.join('assets/images/device.jpg')))
  end

  subject do
    RoastBrand.create(
      brand_name: 'Fake Brand Name',
      roast_name: 'Fake Roast Name',
      image: image,
      roast: roast
    )
  end

  it { should validate_presence_of :brand_name }
  it { should validate_presence_of :roast_name }
  it { should validate_presence_of :image }
  it { should validate_presence_of :roast_id }

  describe "#to_s" do
    it "returns the roast brand's roast_name" do
      expect(subject.to_s).to eql 'Fake Roast Name'
    end
  end

end
