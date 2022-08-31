class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :places, dependent: :destroy
         has_many :place_comments, dependent: :destroy
         has_many :join_places, dependent: :destroy
         has_many :nice_coupons, dependent: :destroy
         has_many :join_places, dependent: :destroy

         has_one_attached :profile_image
         
         def get_profile_image(width, height)
           unless profile_image.attached?
             file_path = Rails.root.join('app/assets/images/no_image.jpeg')
             profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
           end
            profile_image.variant(resize_to_limit: [width, height]).processed
         end

         #ゲストユーザーログイン時に仮で作成されるeメールとユーザー
         def self.guest
             find_or_create_by!(email: 'guest@example.com', name: 'gest') do |user|
                 user.password = SecureRandom.urlsafe_base64
             end
         end

         # 退会ステータスが退会の場合ログインできないようにするコード
         def active_for_authentication?
           super && (is_deleted == false)
         end


end
