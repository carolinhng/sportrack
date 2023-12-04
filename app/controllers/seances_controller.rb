class SeancesController < ApplicationController


  def create
    @seance = Seance.new
    @training = Training.find(params[:training_id])
    @seance.training_id = @training.id
    if @seance.save!
      redirect_to edit_training_seance_path(@training, @seance)
    else
      render "trainings/show"
    end
  end

  def edit
    @training = Training.find(params[:training_id])
    @seance = Seance.find(params[:id])
    @training_value = TrainingValue.new
    # @training_metric = @seance.training_metrics.build
    @training_exercices = @seance.training.training_exercices
    raise
  end

  def update
    @seance = Seance.find(params[:id])
    raise
    if @seance.update(seance_params)
      # ... redirection ou autre traitement après la mise à jour ...
    else
      render :edit
    end
  end

  private

  def seance_params
   params.require(:seance).permit(:date, :comment, :rating, :duration, training_metrics_attributes: [:duration, :average_speed, :repetition, :serie, :weight, :break_time])
  end

end
