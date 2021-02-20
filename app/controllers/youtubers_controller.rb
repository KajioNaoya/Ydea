class YoutubersController < ApplicationController
  #before_action :authenticate_user!

  def index
    @youtubers = YouTuber.all
  end

  def show
    @youtuber = YouTuber.find(params[:id])
    @ideas = @youtuber.ideas
    @new_idea = Idea.new
  end

  def new
  end

  def edit
  end
end
