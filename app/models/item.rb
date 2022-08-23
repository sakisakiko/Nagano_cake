class Item < ApplicationRecord
  has_one_attached:image
  
  belong_to :genre
end
