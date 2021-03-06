class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :buildings
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  def self.guest
    user =
      User.find_or_create_by(email: 'guest@example.com') do |user|
        user.password = SecureRandom.urlsafe_base64
        user.confirmed_at = Time.now
      end
  end
end
