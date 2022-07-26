class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :places, dependent: :destroy
         has_many :place_comments, dependent: :destroy
         has_many :join_places, dependent: :destroy
         has_many :nice_copons, dependent: :destroy

         def self.guest
             find_or_create_by!(email: 'guest@example.com') do |user|
                 user.password = SecureRandom.urlsafe_base64
             end
         end
end
