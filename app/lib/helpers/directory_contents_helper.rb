module Helpers

  class DirectoryContentsHelper

    def self.get_readable_file_names(directory:, filetype:)
      Dir.chdir (Rails.root.to_s + directory)
      Dir.glob("*.#{filetype}")
    end

  end

end
