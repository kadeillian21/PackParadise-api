class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { in: 10..500 }
  # validates_format_of :image_url, :with => %r{\.(png|jpb|jpeg)$}i, :message -> "Must have vaild image file type", :multiline => true
  belongs_to :supplier
  has_many :orders
  has_many :category_products
  has_many :carted_products
  has_many :categories, through: :category_products

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
