module SimplestPhoto
  module Model
    module Photo

      def self.extended(base)
        base.class_eval do
          dragonfly_accessor :image

          has_many :photo_attachments, dependent: :destroy
          has_many :photo_croppings,   dependent: :destroy

          validates :name, :image, presence: true

          validates_property :mime_type, of: :image, in: %w(image/jpeg image/png)

          scope :by_name, -> { order(name: :asc) }

          delegate :url, :thumb, to: :image
        end
      end

    end
  end
end
