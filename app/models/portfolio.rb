class Portfolio < ApplicationRecord
  has_many :technologies

  include Placeholder
  validates_presence_of :title, :body

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby On Rails') }
  scope :vue, -> { where(subtitle: 'VueJS') }

  after_initialize :set_defaults

  private

  def set_defaults
    self.main_image ||= Placeholder.image_generator(width: 600, height: 400)
    self.thumb_image ||= Placeholder.image_generator(width: 350, height: 200)
  end
end
