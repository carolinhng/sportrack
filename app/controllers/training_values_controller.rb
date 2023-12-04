class TrainingValuesController < ApplicationController
  def create
    @training_value = TrainingValue.new(params_value)
    @seance = Seance.find(params[:seance_id])
    @training_value.seance_id = @seance.id
    raise
  end
end
