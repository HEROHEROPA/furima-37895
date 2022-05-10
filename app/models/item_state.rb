class ItemState < ActiveHash::Base
  self.data = [
    { id: 1, item_state: '--' },
    { id: 2, item_state: '新品・未使用' },
    { id: 3, item_state: '未使用に近い' },
    { id: 4, item_state: '目立った傷や汚れなし' },
    { id: 5, item_state: 'やや傷や汚れあり' },
    { id: 6, item_state: '傷や汚れあり' },
    { id: 7, item_state: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end
