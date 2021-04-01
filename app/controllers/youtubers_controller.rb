class YoutubersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, raise: false
  layout 'standard_header'

  def index
    @q = YouTuber.all.remove_out_of_date.ransack(params[:q])
    @youtubers = @q.result(distinct: true).old_to_top.page(params[:page])
  end

  def show
    @youtuber = YouTuber.find(params[:id])
    @ideas = @youtuber.ideas.page(params[:page])
    @new_idea = Idea.new
  end

  def new
  end

  def edit
  end
end
