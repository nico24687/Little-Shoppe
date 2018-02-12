class Store < ApplicationRecord

  has_many :items
  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  enum status: ["pending", "active", "inactive"]

  has_many :users

  before_save :generate_slug

   def generate_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end

end