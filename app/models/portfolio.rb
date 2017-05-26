class Portfolio < ApplicationRecord
  include Placeholder

  has_many :technologies, inverse_of: :portfolio
  accepts_nested_attributes_for :technologies,
                                reject_if: proc { |attributes| attributes['name'].blank? }

  validates_presence_of :title, :body
  after_initialize :set_defaults
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby On Rails') }
  scope :vue, -> { where(subtitle: 'VueJS') }
  scope :by_position, -> {}

  private

  def set_defaults
    self.main_image ||= Placeholder.image_generator(width: 600, height: 400)
    self.thumb_image ||= Placeholder.image_generator(width: 350, height: 200)
  end
end
