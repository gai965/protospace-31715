class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_prototypes = Prototype.includes(:user).where(user_id: @user.id)
  end
end