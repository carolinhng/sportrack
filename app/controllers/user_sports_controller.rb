class UserSportsController < ApplicationController

  def index
    @trainings = current_user.trainings
  end

  def create
    @user = current_user
    @sport = Sport.find(params[:sport_id])
    @user_sport = UserSport.find_or_initialize_by({user_id: @user.id, sport_id: @sport.id})

    if @user_sport.save
      redirect_to user_sport_path(@user_sport)
    else
    render :index, status: :unprocessable_entity
    end
  end


  def show
    @user_sport = UserSport.find(params[:id])
    @active = params[:query].present?
    if @active
      @seances = Seance.search_seance_exercice_and_training(params[:query])
    else
      @seances = Seance.all
    end
  end

  def dashboard
    @name = current_user.name
  end

  private

  def user_sport_params
    params.require(:user_sport).permit(:user_id, :name, :sport_id)
  end

end
