class Place < ApplicationRecord

  belongs_to :user

  has_many :place_comments, dependent: :destroy
  has_many :join_places, dependent: :destroy

  def join_placed_by?(user)
    join_places.exists?(user_id: user.id)
  end

end
