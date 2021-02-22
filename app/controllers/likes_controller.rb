class LikesController < ApplicationController
    def create
        @like = current_user.likes.create(idea_id: params[:idea_id])
        head :no_content
    end
    
    def destroy
        @like = Like.find_by(idea_id: params[:idea_id], user_id: current_user.id)
        @like.destroy
        head :no_content
    end
end
