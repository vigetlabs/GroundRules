class Device < ApplicationRecord
  extend SimplestPhoto::HasPhoto
  extend Gastropod
  include Gastropod::ActiveRecord::Validations

  before_save :assign_generated_slug

  has_many :device_problems
  accepts_nested_attributes_for :device_problems, :allow_destroy => true

  has_photo :image, required: true

  acts_as_list

  validates :name, presence: true, uniqueness: true

  slug :create_slug

  def to_s
    name
  end

  private

  def create_slug
    name.to_s.downcase.gsub(/[^a-z]/, '')
  end

end
