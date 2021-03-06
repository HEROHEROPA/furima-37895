class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
   validates :item_name, :price, :item_explaining, :image, presence: true

 

  validates :item_state_id, :pay_for_shipping_id, :shipping_region_id, :shipping_day_id, :category_id,
            numericality: { other_than: 1 }

  validates :price, #format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
                     format: { with: /\A[0-9]+\z/, message: 'が無効です。半角数字での入力をお願いします。' }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  has_one_attached :image

  belongs_to :user
  has_one :shipping

  belongs_to :category, :item_state, :pay_for_shipping, :shipping_day, :shipping_region
end
