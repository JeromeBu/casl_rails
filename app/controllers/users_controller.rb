class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show
    @children = Child.where(user: @user)
  end

  def edit
  end

  def update
    @children = @user.children
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      respond_to do |format|
       format.html { render 'users/show' }
       format.js
     end
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
