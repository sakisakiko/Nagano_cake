class Address < ApplicationRecord
  MAX_POSTS_COUNT = 3
  # 登録したい件数の制限数

  belongs_to :customer

  validate :addresses_count_must_be_within_limit
  # 制限のためのバリデーション

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end


   private

    def addresses_count_must_be_within_limit
      errors.add(:base, "addresses count limit: #{MAX_POSTS_COUNT}") if customer.addresses.count >= MAX_POSTS_COUNT
    end
    # 配送先の登録数が制限数を超えた時、エラーを返す


end
