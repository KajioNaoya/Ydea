class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @ideas = @user.ideas.recent
  end
end
