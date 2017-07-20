require 'rails_helper'

RSpec.describe Device, type: :model do

  it { should have_many(:device_problems) }

  let!(:image) do
    Photo.create(name: 'Device Image', image: File.open(Rails.root.join('assets/images/device.jpg')))
  end

  subject { Device.create(name: 'Fake Device Name', image: image) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :image }

  it { should validate_uniqueness_of :name }

  describe "#to_s" do
    it "returns the device's name" do
      expect(subject.to_s).to eql 'Fake Device Name'
    end
  end

end
