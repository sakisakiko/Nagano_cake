class Order < ApplicationRecord
  has_one_attached:image
  belongs_to :customer
  has_many :order_details,dependent: :destroy

enum payment_method: { credit_card: 0, transfer: 1 }
enum status: {  undeposited: 0,  deposited: 1, making: 2,unshipped: 3, shipped:4 }
# undeposited: "入金待ち" deposited: "入金確認" making: "製作中" unshipped: "発送準備中" shipped: "発送済み"


  def  get_image(width,height)
    unless image.attached?
      file_path=Rails.root.join('app/assets/images/l_e_others_501.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

end
