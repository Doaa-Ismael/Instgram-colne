class UsersController < ApplicationController
  def show
    @posts = User.find(params[:id]).posts.order created_at: :desc #.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender, :avatar)
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end
end
