class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, item_state: '--' },
    { id: 2, item_state: '1~2日で発送' },
    { id: 3, item_state: '2~3日で発送' },
    { id: 4, item_state: '4~7日で発送' },
  ]

  include ActiveHash::Associations
  has_many :items
  end


  


