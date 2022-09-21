class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      
      t.string :shop
      t.string :coupon_name
      t.date :from_day
      t.date :to_day
      t.string :content

      t.timestamps
    end
  end
end
