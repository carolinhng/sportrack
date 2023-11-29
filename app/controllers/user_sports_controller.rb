class UserSportsController < ApplicationController

  def index

  end

  def create
    @user = current_user
    @sport = Sport.find(params[:sport_id])
    @user_sport = UserSport.new({user_id: @user.id, sport_id: @sport.id})

    if @user_sport.save
      redirect_to user_sport_path(@user_sport)
    else
    render :index, status: :unprocessable_entity
    end
  end


  def show
    @user_sport = UserSport.find(params[:id])
  end

  private

  def user_sport_params
    params.require(:user_sport).permit(:user_id, :name, :sport_id)
  end

end
