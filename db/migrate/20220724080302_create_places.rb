class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|

      t.integer :user_id
      t.string :user_name
      t.string :subject
      t.string :body
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :spot
      t.string :place_at


      t.timestamps
    end
  end
end
