class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show
    @user = User.find(params[:id])
    @children = Child.where(user: @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user

  end

  def user_params
    params.require(:user).permit(:email, :civility, :first_name, :last_name, :address, :main_phone, :secondary_phone)
  end
end
