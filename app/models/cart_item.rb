class CartItem < ApplicationRecord
  has_one_attached:image
  belongs_to :customer
  belongs_to :item


  ## 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end


  def  get_image(width,height)
    unless image.attached?
      file_path=Rails.root.join('app/assets/images/l_e_others_501.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end



end
