require 'rails_helper'

RSpec.describe Roast, type: :model do

  it { should have_many(:roast_brands) }

  let!(:image) do
    Photo.create(name: 'Roast Image', image: File.open(Rails.root.join('assets/images/roast.jpg')))
  end

  subject do
    Roast.create(
      name: 'Fake Roast Name',
      description: 'This is s fake description',
      sub_description: 'This is a fake sub description',
      image: toggle_image
    )
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :image }
  it { should validate_presence_of :description }
  it { should validate_presence_of :sub_description }

  it { should validate_uniqueness_of :name }

  describe "#to_s" do
    it "returns the roast's name" do
      expect(subject.to_s).to eql 'Fake Roast Name'
    end
  end

end
