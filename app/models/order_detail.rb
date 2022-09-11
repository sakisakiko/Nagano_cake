class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum status: {  untouched: 0,  preparation: 1, making: 2, completed: 3 }

    ## 小計を求めるメソッド
  def subtotal
    price * amount
  end

end
