class TrainingsController < ApplicationController

  def index
    # index vers page entrainements
    @trainings = current_user.trainings
    @active = params[:query].present?
    if @active
      @seances = Seance.search_seance_sport_and_training(params[:query])
    else
      @seances = Seance.all
    end
  end

  def new
    @training = Training.new
    @user_sport = UserSport.find(params[:user_sport_id])
  end

  def create
    @training = Training.new(params_training)
    @usersport = UserSport.find(params[:user_sport_id])
    @training.user_sport_id = @usersport.id
    if @training.save!
      redirect_to new_training_training_exercice_path(@training)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @training = Training.find(params[:id])
  end


  def destroy
    @training = Training.find(params[:id])
    @training.destroy!
    # redirect_to trainings_path(@training), status: :see_other
    redirect_back(fallback_location: trainings_path)
  end

  def training_data
    @training = Training.find(params[:id])
    @training_exercices = @training.training_exercices
  end

  private

  def params_training
    params.require(:training).permit(:name, :description, :user_sport_id)
  end

end
