class YouTuber < ApplicationRecord
    has_many :ideas

    validates :name, presence: true
    validates :channel_id, presence: true

    scope :remove_out_of_date, -> { where('due >= ?', Date.today) }
    scope :old_to_top, -> {order(:due)}

    def self.ransackable_attributes(auth_object = nil)
        %w[name]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end

    mount_uploader :icon, IconUploader
end
