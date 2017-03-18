class ChildrenController < ApplicationController

  before_action :set_user, only: [:new, :edit]
  before_action :set_child, only: [:edit, :update, :destroy]


  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    @user = @child.user
    if @child.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user = @child.user
    if @child.update(child_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @child.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :sex, :birth_date, :school, :class, :extra_info, :user_id)
  end
end
