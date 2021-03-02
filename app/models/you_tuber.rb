class YouTuber < ApplicationRecord
    has_many :ideas

    validates :name, presence: true
    validates :channel_id, presence: true
end
