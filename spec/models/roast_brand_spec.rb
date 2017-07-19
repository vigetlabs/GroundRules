require 'rails_helper'

RSpec.describe RoastBrand, type: :model do

  it { should belong_to(:roast) }

  let!(:toggle_image) do
    Photo.create(url: 'http://www.faketoggleimageurl.com/')
  end

  let!(:roast) do
    Roast.create(
      name: 'Fake Roast Name',
      toggle_image: toggle_image,
      toggle_text: 'This is fake toggle text',
      description: 'This is a fake description'
    )
  end

  let!(:image) do
    Photo.create(url: 'http://www.fakeimageurl.com/')
  end

  subject do
    RoastBrand.create(
      brand_name: 'Fake Brand Name',
      roast_name: 'Fake Roast Name',
      image_url: image,
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
