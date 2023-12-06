class TrainingExercicesController < ApplicationController
  def index
    @training_exercices = TrainingExercice.all
    @training = Training.find(params[:training_id])
    @training_exercices = @training.training_exercices
  end

  def new
    @training = Training.find(params[:training_id])
    @user_sport_id = @training.user_sport_id
    @user_sport = UserSport.find(@user_sport_id)
    @sport = Sport.find(@user_sport.sport_id)
    @exercices = @sport.exercices
    # -------------Decompte des exercices---------------------
    @number = @training.exercices.count
    @counter = @number > 1 ? "#{@number} exercices" : "#{@number} exercice"
    if params[:query].present?
      @exercices = Exercice.search_exercices(params[:query])
    end
  end

  def create
    @training_exercice = TrainingExercice.create!(exercice_id: params[:exercice_id], training_id: params[:training_id])
    @training_exercice.exercice.metrics.each do |metric|
      TrainingMetric.create!(
        training_exercice: @training_exercice,
        metric: metric.metric,
        unit: metric.unit
      )
    end
    redirect_to new_training_training_exercice_path
  end

  def update
    # -------------------  Sortable -----------------------------
    # @training_exercise = TrainingExercice.find(params[:training_exercice_id])
    # if @training_exercise.update(position: params[:exercice][:position])
    #   redirect_to training_exercices_path, notice: 'Training Exercise updated successfully.'
    # else
    #   render :edit
    # end

    @training_exercice = TrainingExercice.find(params[:id])
    @training = @training_exercice.training
    if @training_exercice.update(training_exercice_params)
      redirect_to training_exercice_path
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

  def training_exercice_params
    params.require(:training_exercice).permit(:position, :id, :training_id, :exercice_id, training_metrics_attributes: [:id, :_destroy, :metric, :unit])
  end

end
