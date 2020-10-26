class Petition < ApplicationRecord
  has_many :signatures

  validates_presence_of :title, :body

  extend FriendlyId

  friendly_id :title, use: [:slugged]
  before_validation :nillify_empty_slug, prepend: true

  def nillify_empty_slug
    self.slug = nil if slug.blank?
  end
end
