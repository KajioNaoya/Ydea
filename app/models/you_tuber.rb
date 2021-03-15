require 'google/apis/youtube_v3'
require 'open-uri'

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
    mount_uploader :banner, BannerUploader

    def fetch_icon_and_banner
        options = {
            :id => self.channel_id #YouTubeチャンネルのIDを指定
          }
          
        youtube = Google::Apis::YoutubeV3::YouTubeService.new
        youtube.key = "AIzaSyBZ70KKgOctaypH8hHAuhDXga0KpLbyZzU"
        logger.debug "キーはこちら！！"
        logger.debug ENV["YOUTUBE_API_KEY"]

        response1 = youtube.list_channels("snippet", options)
        @channel_icon = response1.items[0].snippet.thumbnails.high
        iconUploader = IconUploader.new(self)
        iconUploader.store!(@channel_icon)
        
        response2 = youtube.list_channels("brandingSettings", options)
        @channel_banner_url = response2.items[0].branding_settings.image.banner_image_url
        self.remote_banner_url = @channel_banner_url

        self.name = response1.items[0].snippet.title

        logger.debug self.icon.file.nil?
    end
end
