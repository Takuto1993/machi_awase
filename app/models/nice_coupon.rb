class NiceCoupon < ApplicationRecord
  
  belongs_to :user
  belongs_to :coupon
  
end
