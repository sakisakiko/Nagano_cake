class Item < ApplicationRecord
  has_one_attached:image
  belongs_to :genre
  has_many :cart_items,dependent: :destroy
  has_many :order_details,dependent: :destroy
 
  #販売ステータスを確認するバリデーション
 validates :is_active, inclusion: { in: [true, false] }
 
   # 消費税を加えた商品価格
    def with_tax_price
     (self.price * 1.10).floor
    end


  
    def  get_image(width,height)
     unless image.attached?
       file_path=Rails.root.join('app/assets/images/l_e_others_501.jpeg')
       image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
     end
       image.variant(resize_to_limit: [width, height]).processed
    end
  
   
end
