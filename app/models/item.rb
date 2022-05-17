class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name, :price, :item_explaining, :image, presence: true
  validates :item_state_id, :pay_for_shipping_id, :shipping_region_id, :shipping_day_id, :category_id,
            numericality: { other_than: 1 }

  validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 9_999_999 }

  has_one_attached :image

  belongs_to :user
  has_one :shipping

  belongs_to :category, :item_state, :pay_for_shipping, :shipping_day, :shipping_region
end
