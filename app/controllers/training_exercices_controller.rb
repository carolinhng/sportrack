class TrainingExercicesController < ApplicationController
  def new
    @exercices = Exercice.all
    @training = Training.find(params[:training_id])
    @user_sport = @training.user_sport_id
    @number = TrainingExercice.all.count - Exercice.all.count
    @training_exercice = TrainingExercice.new
      if params[:query].present?
        @exercices = Exercice.search_exercices(params[:query])
      end
  end

  def create
   @training_exercice =  TrainingExercice.create!(exercice_id: params[:exercice_id], training_id: params[:training_id])
   redirect_to new_training_training_exercice_path
   training_metrics = TrainingMetric.new
   training_metrics.training_exercice_id = @training_exercice.id
   training_metrics.save!
  end

  def destroy
    @training_exercice = TrainingExercice.find(params[:id])
    @training = @training_exercice.training
    @training_exercice.destroy
    redirect_to new_training_training_exercice_path(@training), status: :see_other
  end
end
