class Admin::YoutubersController < ApplicationController
  before_action :require_admin

  def new
    @youtuber = YouTuber.new
  end

  def create
    @youtuber = YouTuber.new(youtuber_params)
    if @youtuber.save
      redirect_to admin_youtuber_url(@youtuber), notice: "登録しました。"
    else
      render :new
    end
  end

  def edit
    @youtuber = YouTuber.find(params[:id])
  end

  def show
    @youtuber = YouTuber.find(params[:id])
  end

  def index
    @youtubers = YouTuber.all
  end

  def update
    @youtuber = YouTuber.find(params[:id])

    if @youtuber.update(youtuber_params)
      redirect_to admin_youtuber_url(@youtuber), notice: '更新しました。'
    else
      render :edit
    end
  end
  
  def destroy
    @youtuber = YouTuber.find(params[:id])
    @youtuber.destroy
    redirect_to admin_youtubers_url, notice: '削除しました。'
  end

  private
  def youtuber_params
    params.require(:you_tuber).permit(:name, :channel_id, :title, :detail, :due, :icon)
  end

  def require_admin
    redirect_to root_url unless current_user&.admin?
  end
end
