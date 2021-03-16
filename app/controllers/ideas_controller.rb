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
    @idea.save
    redirect_to youtuber_path(@idea.you_tuber_id)      
  end

  def edit
    if current_user&.admin?
      @idea = Idea.find(params[:id])
    elsif current_user
      @idea = current_user.ideas.find(params[:id])
    end
  end

  def update
    if current_user&.admin?
      @idea = Idea.find(params[:id])
    elsif current_user
      @idea = current_user.ideas.find(params[:id])
    end
    @idea.update!(idea_params)
    redirect_to youtuber_path(@idea.you_tuber_id)
  end

  def destroy
    if current_user&.admin?
      @idea = Idea.find(params[:id])
    elsif current_user
      @idea = current_user.ideas.find(params[:id])
    end
    @idea.destroy!
    redirect_to session[:previous_url] || root_path
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :detail, :you_tuber_id)
  end
end
