module SvgHelper

  def build_full_filepath(filename)
      Rails.root.join('app', 'views', 'shared', 'icons', filename).to_s
  end

end
