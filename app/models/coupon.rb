class Coupon < ApplicationRecord

  has_many :nice_coupons

  def nice_couponed_by?(user)
    nice_coupons.exists?(user_id: user.id)
  end
  
  validate :shop
   {presence: true, length: { maximum: 30 } }
  validate :coupon_name
   {presence: true, length: { maximum: 30 } }
  validates :content, presence: true
  
end
