class YouTuber < ApplicationRecord
    has_many :ideas

    validates :name, presence: true
    validates :channel_id, presence: true

    scope :remove_out_of_date, -> { where('due >= ?', Date.today) }
end
