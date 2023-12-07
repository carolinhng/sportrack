class TrainingMetricsController < ApplicationController
  def destroy
    @training_metric = TrainingMetric.find(params[:id])
    @training = @training_metric.training_exercice.training
    @training_metric.destroy!
    redirect_to training_training_exercices_path(@training), status: :see_other
  end

  def update
    # -------------------  Sortable -----------------------------
    @training_metric = TrainingMetric.find(params[:id])
    @training = @training_metric.training_exercice.training
    @training_metric.update(training_metric_params)
    #   redirect_to training_training_exercices_path(@training)
    # else
    #   render :edit
    # end
  end

  def training_metric_params
    params.require(:training_metric).permit(:position)
  end
end
