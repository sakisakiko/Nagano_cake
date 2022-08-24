class Item < ApplicationRecord
  has_one_attached:image
  belongs_to :genre
  has_many :cart_items,dependent: :destroy
  has_many :order_details,dependent: :destroy
  
 validates :is_active, inclusion: { in: [true, false] }
 
end
