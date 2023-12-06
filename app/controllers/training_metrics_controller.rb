class TrainingMetricsController < ApplicationController
  def destroy
    @training_metric = TrainingMetric.find(params[:id])
    @training = @training_metric.training_exercice.training
    @training_metric.destroy!
    redirect_to training_training_exercices_path(@training), status: :see_other
  end

  def update
    # -------------------  Sortable -----------------------------
    raise
    @training_metric = TrainingMetric.find(params[:id])
    @training = @training_metric.training_exercice.training
    if @training_metric.update(position: params[:position])
      redirect_to training_training_exercices_path(@training)
    else
      render :edit
    end
  end


  def todo_params
    params.require(:training_metric).permit(:position)
  end

end
