class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  validates :name, presence: true, length: { maximum: 20 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png] },
                    size: { less_than: 1.megabytes }

  # ゲストユーザーを探す、または作成する機能
  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # 表示用のリサイズ済み画像を返す
  def image80
    image.variant(gravity: :center, resize: '80x80^', crop: '80x80+0+0').processed
  end
end
