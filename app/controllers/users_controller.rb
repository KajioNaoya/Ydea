class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'standard_header'

  def show
    @user = current_user
    @ideas = @user.ideas.recent
  end

  def update
    @user = current_user
    @user.update!(user_params)
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end
