class Portfolio < ApplicationRecord
  has_many :technologies, inverse_of: :portfolio
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['name'].blank? }

  validates_presence_of :title, :subtitle, :body, :technologies
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby On Rails') }
  scope :vue, -> { where(subtitle: 'VueJS') }
  scope :by_position, -> {}
end
