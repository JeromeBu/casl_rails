class GrownActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_grown_activity, only: [:edit, :update, :show, :destroy]

  def index
    # @activities = Activity.all
    @grown_activity = GrownActivity.new
    @grown_activities = policy_scope(GrownActivity)
  end

  def show
    @grown_inscription = GrownInscription.new
    @grown_activity_article = GrownActivityArticle.new(grown_activity: @grown_activity)
  end


  def new
    @grown_activity = GrownActivity.new
    authorize @grown_activity
  end


  def create
    @grown_activity = GrownActivity.new(grown_activity_params)
    # Photo par default si pas de photo choisie
    authorize @grown_activity

    if @grown_activity.save
      url = "http://res.cloudinary.com/dpmc03d5t/image/upload/v1489930552/lp2uzwtcbreav53nzqvc.jpg"
      @grown_activity.photo_url = url if @grown_activity.photo.blank?
      redirect_to grown_activity_path(@grown_activity)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @grown_activity.update(grown_activity_params)
      redirect_to grown_activity_path(@grown_activity)
    else
      render :edit
    end
  end

  def destroy
    @grown_activity.destroy
    redirect_to grown_activities_path
  end

  # private

  def set_grown_activity
    @grown_activity = GrownActivity.find(params[:id])
    authorize @grown_activity
  end

  def grown_activity_params
    params.require(:grown_activity).permit(:title, :subtitle, :max_participants, :photo)
  end
end
