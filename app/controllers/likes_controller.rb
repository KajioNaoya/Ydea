class LikesController < ApplicationController
    def create
        @like = current_user.likes.create(idea_id: params[:idea_id])
        redirect_to youtuber_path(@like.idea.you_tuber)
    end
    
    def destroy
        @like = Like.find_by(idea_id: params[:idea_id], user_id: current_user.id)
        @like.destroy
        redirect_to youtuber_path(@like.idea.you_tuber)
    end
end
