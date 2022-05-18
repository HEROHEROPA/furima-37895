class Order
  include ActiveModel::Model
  attr_accessor  :postal_code, :shipping_region_id, :city, :house_number, :house_name,:phone_number,:shipping_id, :item_id, :user_id,:token

  validates  :city, :house_number, :token, :user_id, :item_id, presence: true
 
  validates :phone_number , format: { with: /\A[0-9]+\z/ } 
 
  with_options presence: true do
    validates :phone_number , length: { minimum: 10 , maximum: 11}
   
    validates :postal_code , format: { with: /\A\d{3}[-]\d{4}\z/  }

    validates  :shipping_region_id ,numericality: { other_than: 1 }

   end

  def save
      shipping = Shipping.new(item_id:item_id,user_id:user_id)
      shipping.save
      address = Address.new(postal_code: postal_code,shipping_region_id: shipping_region_id,city: city,house_number: house_number,house_name: house_name,phone_number: phone_number,shipping_id:shipping.id)
      address.save
  end  
  
end