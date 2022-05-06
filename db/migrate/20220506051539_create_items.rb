class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string   :item_name, null:false
      t.text     :item_explaining, null:false
      t.integer  :category_id , null:false
      t.integer  :item_state_id, null:false
      t.integer  :pay_for_shipping_id, null:false
      t.integer  :shipping_region_id, null:false
      t.integer  :shipping_day_id, null:false
      t.integer  :price , null:false
      t.references :user,null:false, foreign_key:true

      t.timestamps
    end
  end
end
