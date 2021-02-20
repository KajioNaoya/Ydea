class IdeasController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    @idea.save!
    redirect_to youtuber_path(@idea.you_tuber_id)

  end

  def edit
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :detail, :you_tuber_id)
  end
end
