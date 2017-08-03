require 'rails_helper'

RSpec.describe SvgHelper do

  describe 'build_full_filepath' do

    context 'given a filepath' do

      it 'correctly returns a string corresponding to the appropriate file location' do
        filepath = helper.build_full_filepath('test.html.erb')

        expect(filepath).to eq (Rails.root.to_s + '/app/views/shared/icons/test.html.erb')
      end

    end

  end

end
