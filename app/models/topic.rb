class Topic < ApplicationRecord
  has_many :blogs

  validates_presence_of :title

  scope :with_blogs, -> { includes(:blogs)
                              .where.not(blogs: { id: nil }) }
end
