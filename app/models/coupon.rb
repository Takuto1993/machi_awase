class Coupon < ApplicationRecord

  has_many :nice_coupons

  def nice_couponed_by?(user)
    nice_coupons.exists?(user_id: user.id)
  end
  
  validates :shop,
   {presence: true, length: { maximum: 30 } }
  validates :coupon_name,
   {presence: true, length: { maximum: 30 } }
  validates :from_day, presence: true
  validates :to_day, presence: true
  validates :content, presence: true
  
end
