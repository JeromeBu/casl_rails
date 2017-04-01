class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_activity, only: [:edit, :update, :show, :destroy]

  def index
    # @activities = Activity.all
    @activity = Activity.new
    @activities = policy_scope(Activity)
  end

  def show
    @child = Child.new
    @inscription = Inscription.new
    @article = Article.new(activity: @activity)
  end


  def new
    @activity = Activity.new
    authorize @activity
  end


  def create
    @activity = Activity.new(activity_params)
    # Photo par default si pas de photo choisie
    authorize @activity

    if @activity.save
      url = "http://res.cloudinary.com/dpmc03d5t/image/upload/v1489930552/lp2uzwtcbreav53nzqvc.jpg"
      @activity.photo_url = url if @activity.photo.blank?
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def activity_params
    params.require(:activity).permit(:title, :subtitle, :max_participants, :photo)
  end
end
