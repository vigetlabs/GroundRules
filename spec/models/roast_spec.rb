require 'rails_helper'

RSpec.describe Roast, type: :model do

  it { should have_many(:roast_brands) }

  let!(:toggle_image) do
    Photo.create(name: 'Roast Image', image: File.open(Rails.root.join('assets/images/roast.jpg')))
  end

  subject do
    Roast.create(
      name: 'Fake Roast Name',
      toggle_text: 'This is fake toggle text',
      toggle_image: toggle_image
    )
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :toggle_image }
  it { should validate_presence_of :toggle_text }

  it { should validate_uniqueness_of :name }

  describe "#to_s" do
    it "returns the roast's name" do
      expect(subject.to_s).to eql 'Fake Roast Name'
    end
  end

end
