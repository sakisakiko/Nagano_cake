class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details,dependent: :destroy
  
enum payment_method: { credit_card: 0, transfer: 1 }
enum status: {  undeposited: 0,  deposited: 1, making: 2,unshipped: 3, shipped:4 }
 
end
