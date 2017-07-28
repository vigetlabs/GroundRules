module Helpers

  class SvgHelper

    def self.build_full_filepath(filename)
      Rails.root.to_s + '/app/views/shared/icons/' + filename
    end

  end

end
