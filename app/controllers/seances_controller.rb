class SeancesController < ApplicationController
  def edit
    @training = Training.find(params[:training_id])
    @seance = Seance.find(params[:id])
    @training_exercices = @seance.training.training_exercices
  end

  def show
    @seance = Seance.find(params[:id])
    @training_exercices = @seance.training.training_exercices
  end

  def create
    @seance = Seance.new
    @training = Training.find(params[:training_id])
    @seance.training_id = @training.id
    if @seance.save!
      @training.training_exercices.each do |training_exercice|
        training_exercice.training_metrics.each do |training_metric|
          TrainingValue.create!(
            training_metric_id: training_metric.id,
            seance_id: @seance.id,
            value: ""
          )
        end
      end
      redirect_to edit_training_seance_path(@training, @seance)
    else
      render "trainings/show"
    end
  end

  def update
    @seance = Seance.find(params[:id])
    if @seance.update(seance_params)
      redirect_to @seance, notice: 'Séance mise à jour avec succès.'
    else
      render :edit
    end
  end

  private

  def seance_params
    params.require(:seance).permit(:date, :comment, :rating, :duration, training_values_attributes: [:id, :value, :training_metric_id])
  end

end
