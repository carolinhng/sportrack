class SportsController < ApplicationController
  def index
    @sports = Sport.all
    @user = current_user
  end
end
