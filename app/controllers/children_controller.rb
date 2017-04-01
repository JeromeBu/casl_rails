
class ChildrenController < ApplicationController

  before_action :set_user, only: [:new, :edit, :index]
  before_action :set_child, only: [:edit, :update, :destroy]
  after_filter :save_my_previous_url, only: [:new]


  def index
    @children = policy_scope(Child).where(user: @user).order(birth_date: :desc)
  end

  def create
    @child = Child.new(child_params)
    authorize @child
    @user = @child.user
    puts "-----------------------------------------"
    p params
    p @inscription
    p @activity
    if @child.save
      respond_to do |format|
        format.html { redirect_to session[:my_previous_url] || user_path(current_user) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
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
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js
    end
  end

  private

  def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  end

  def set_child
    @child = Child.find(params[:id])
    authorize @child
  end

  def set_user
    @user = current_user
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :sex, :birth_date, :school, :classe, :extra_info, :user_id)
  end
end
