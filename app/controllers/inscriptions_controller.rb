class InscriptionsController < ApplicationController

  def create
    @inscription = Inscription.new(inscription_params)
    @activity = @inscription.activity
    if @inscription.save
      redirect_to activity_path(@activity)
    else
      render 'activities/show'
    end
  end

  private

  def inscription_params
    params.require(:inscription).permit(:activity_id, :child_id)
  end
end
