require 'rails_helper'

RSpec.describe Roast, type: :model do

  it { should have_many(:roast_brands) }

  let!(:toggle_image) do
    Photo.create(url: 'http://www.faketoggleimageurl.com/')
  end

  subject do
    Roast.create(
      name: 'Fake Roast Name',
      toggle_image_url: toggle_image,
      toggle_text: 'This is fake toggle text',
      description: 'This is a fake description'
    )
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :toggle_image }
  it { should validate_presence_of :toggle_text }
  it { should validate_presence_of :description }

  it { should validate_uniqueness_of :name }

  describe "#to_s" do
    it "returns the roast's name" do
      expect(subject.to_s).to eql 'Fake Roast Name'
    end
  end

end
