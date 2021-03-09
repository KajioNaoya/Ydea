class Idea < ApplicationRecord

    belongs_to :user, optional: true
    belongs_to :you_tuber

    has_many :likes
    has_many :liked_users, through: :likes, source: :user
end
