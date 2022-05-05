class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :shippings

  validates :nickname,:last_name, :first_name, :last_name_k,:first_name_k,:birth_date,   presence: true 
         
end
