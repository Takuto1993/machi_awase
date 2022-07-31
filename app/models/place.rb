class Place < ApplicationRecord

  belongs_to :user
  
  has_many :place_comments, dependent: :destroy

end
