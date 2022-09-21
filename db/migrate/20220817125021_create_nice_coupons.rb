class CreateNiceCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :nice_coupons do |t|
      
      t.integer :user_id
      t.integer :coupon_id
      t.string :nice

      t.timestamps
    end
  end
end
