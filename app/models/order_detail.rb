class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum status: {  untouched: 0,  preparation: 1, making: 2, completed: 3 }
 # untouched: "着手不可" preparation: "製作待ち"  making: "製作中" completed: "製作完了"


    ## 小計を求めるメソッド
  def subtotal
    price * amount
  end

end
