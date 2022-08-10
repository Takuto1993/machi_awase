class Place < ApplicationRecord

  belongs_to :user

  has_many :place_comments, dependent: :destroy
  has_many :join_places, dependent: :destroy

  #住所カラムから自動的に緯度、経度の値を入れるようにするコード
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def join_placed_by?(user)
    join_places.exists?(user_id: user.id)
  end


end
