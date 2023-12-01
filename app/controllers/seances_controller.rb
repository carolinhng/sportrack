class SeancesController < ApplicationController
  def edit
    @training = Training.find(params[:training_id])
<<<<<<< HEAD
=======
    @seance = Seance.find(params[:id])
    @training_value = TrainingValue.new
    @training_exercices = @seance.training.training_exercices
>>>>>>> master
  end

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
end
