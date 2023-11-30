class TrainingExercicesController < ApplicationController
  def new
    @exercices = Exercice.all
    if params[:query].present?
      @exercices = Exercice.search_exercices(params[:query])
    end
  end

  def create
  end
end
