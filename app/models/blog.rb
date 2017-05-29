class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :topic
  has_many :comments, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }
  validates_presence_of :title, :body
end
