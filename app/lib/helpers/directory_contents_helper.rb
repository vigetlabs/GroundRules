module Helpers

  class DirectoryContentsHelper

    def self.get_readable_file_names(directory:, filetype:)
      filenames  = Dir.glob(Rails.root.to_s + directory + "/*.#{filetype}")
      filenames.map do |file|
        file.split('/').last
      end
    end

  end

end
