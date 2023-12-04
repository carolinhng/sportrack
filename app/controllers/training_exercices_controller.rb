class TrainingExercicesController < ApplicationController

  def index
    raise
    @training_exercices = TrainingExercice.all
    @training = Training.find(params[:training_id])
    @training_exercices = @training.training_exercices
  end

  def new
    @exercices = Exercice.all
    @training = Training.find(params[:training_id])
    @user_sport = @training.user_sport_id
# -------------Decompte des exercices---------------------
    @number = @training.exercices.count
    @counter = if @number > 1
      "#{@number} exercices"
    else
      "#{@number} exercice"
    end
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

  def update
    @training_exercise = TrainingExercise.find(params[:id])
    if @training_exercise.update(training_exercise_params)
      redirect_to training_exercises_path, notice: 'Training Exercise updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @training_exercice = TrainingExercice.find(params[:id])
    @training = @training_exercice.training
    @training_exercice.destroy
    redirect_to new_training_training_exercice_path(@training), status: :see_other
  end

  private
  def training_exercise_params
    params.require(:training_exercise).permit(:name, :sport_id, training_metrics_attributes: [:id, :metric, :unit, :_destroy])
  end

end
