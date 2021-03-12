class Idea < ApplicationRecord

    belongs_to :user, optional: true
    belongs_to :you_tuber

    has_many :likes
    has_many :liked_users, through: :likes, source: :user

    validates :title, presence: true

    scope :recent, -> {order(created_at: :desc)}
end
