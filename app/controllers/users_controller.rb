class UsersController < ApplicationController
  def show
    @children = Child.where(user: current_user)
  end

  def edit
    @user = current_user
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

  def user_params
    params.require(:user).permit(:email, :civility, :first_name, :last_name, :address, :main_phone, :secondary_phone)
  end
end
