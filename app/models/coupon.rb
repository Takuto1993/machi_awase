class Coupon < ApplicationRecord

  has_many :nice_coupons

  def nice_couponed_by?(user)
    nice_coupons.exists?(user_id: user.id)
  end

end
