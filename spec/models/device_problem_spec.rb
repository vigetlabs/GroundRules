require 'rails_helper'

RSpec.describe DeviceProblem, type: :model do

  it { should belong_to(:device) }

  let!(:device) do
    Device.create(name: 'Fake Device Name', image_url: 'http://www.fakeimageurl.com/')
  end

  subject do
    DeviceProblem.create(
      statement: 'Fake Statement',
      content: { 'fake_content' => 'content' },
      device: device
    )
  end

  it { should validate_presence_of :statement }
  it { should validate_presence_of :content }
  it { should validate_presence_of :device_id }

  describe "#to_s" do
    it "returns the device problem's statement" do
      expect(subject.to_s).to eql 'Fake Statement'
    end
  end

end
