class InscriptionsController < ApplicationController

  def index
    @activity = Activity.find(params[:activity_id])
    authorize @activity
    @inscriptions = policy_scope(Inscription).where(activity: @activity).order(created_at: :desc)
    respond_to
  end

  def create
    @inscription = Inscription.new(inscription_params)
    @inscription.child = Child.where(user: current_user).find_by(first_name: inscription_params[:child_id])
    authorize @inscription
    @activity = @inscription.activity
    if @inscription.save
      redirect_to activity_path(@activity)
    else
      render 'activities/show'
    end
  end

  def get_xlsx
    @activity = Activity.find(params[:activity_id])
    authorize @activity
    @inscriptions = policy_scope(Inscription).where(activity: @activity).order(created_at: :desc)
    @inscriptions.to_xlsx
    respond_to do |format|
        format.xlsx {
            send_data @inscriptions.to_xlsx.to_stream.read, :filename => 'liste_des_inscrits.xlsx', :type => "application/vnd.openxmlformates-officedocument.spreadsheetml.sheet"
        }
    end
  end

  private

  def inscription_params
    params.require(:inscription).permit(:activity_id, :child_id)
  end
end
