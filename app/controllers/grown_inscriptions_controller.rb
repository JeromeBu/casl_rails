class GrownInscriptionsController < ApplicationController

  def index
    @activity = Activity.find(params[:activity_id])
    authorize @activity
    @inscriptions = policy_scope(Inscription).where(activity: @activity).order(created_at: :desc)
  end

  def create
    @grown_inscription = GrownInscription.new(grown_inscription_params)
    @grown_inscription = current_user
    authorize @grown_inscription
    @grown_activity = @grown_inscription.grown_activity
    if @grown_inscription.save
      flash[:notice] = "L'inscription a bien été prise en compte"
      respond_to do |format|
        format.html { redirect_to grown_activity_path(@grown_activity) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'grown_activities/show', grown_activity: @grown_activity }
        format.js
      end
    end
  end

  private

  def grown_inscription_params
    params.require(:grown_inscription).permit(:activity_id, :user_id)
  end
end
