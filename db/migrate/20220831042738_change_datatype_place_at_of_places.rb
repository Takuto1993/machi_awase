class ChangeDatatypePlaceAtOfPlaces < ActiveRecord::Migration[6.1]
  def change
    change_column :places, :place_at, :datetime
  end
end
