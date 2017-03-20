class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show
    @children = Child.where(user: @user)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :civility, :first_name, :last_name, :address, :main_phone, :secondary_phone)
  end
end
