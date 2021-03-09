class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  def already_liked?(idea)
    self.likes.exists?(idea_id: idea.id)
  end

  def self.find_or_create_from_auth(auth)
    logger.debug 'find or create 呼ばれたよ'
    find_or_create_by(email: auth.info.email) do |user|
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end
end
