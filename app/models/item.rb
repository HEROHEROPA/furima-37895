class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name, :price,:item_explaining,    presence: true
  validates :item_state_id,:pay_for_shipping_id,:shipping_region_id,:shipping_day_id,:category_id,  numericality: { other_than: 1 } 
  
  validates :price, format: { with: /\A[0-9]+\z/ }

  has_one_attached :image

  belongs_to :user
  
  
  belongs_to :category,:item_state,:pay_for_shipping,:shipping_day,:shipping_region
end
