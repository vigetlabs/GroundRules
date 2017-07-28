require 'rails_helper'

RSpec.describe Helpers::DirectoryContentsHelper do

  describe '.get_readable_file_names' do

    context 'given an appropriate directory and filetype' do

      it 'correctly returns an array with all files of that filetype in the given directory' do
        files = Helpers::DirectoryContentsHelper.get_readable_file_names(directory: '/assets/images', filetype: 'jpg')

        expect(files).to include 'device.jpg'
        expect(files).to include 'roast.jpg'
      end

    end

  end

end
