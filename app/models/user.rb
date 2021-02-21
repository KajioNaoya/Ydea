class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  def already_liked?(idea)
    self.likes.exists?(idea_id: idea.id)
  end
end
