class UserSportsController < ApplicationController

  def index

  end

  def create
    raise
    @user_sport = UserSport.new(user_sport_params)
    raise
    @user = current_user
    @sport.list = @user
    if @sport.save
      raise
      redirect_to sport_path(@sport)
    else
      raise
    render :new, status: :unprocessable_entity
    end
  end


  def show

  end

  private

  def user_sport_params
    params.require(:user_sport).permit(:user_id, :name, :sport_id)
  end

end
