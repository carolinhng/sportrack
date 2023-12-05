class DataController < ApplicationController

  def index
    # Obtenir les séances réalisés par l'utilisateur
    datas = current_user.seances.group(:date).count
    today = Date.today
    last_seven_days = (0..6).map { |i| (today - i) }.reverse

    seances_by_dates = last_seven_days.map do |date|
      datas[date] || 0
    end
    @seances_by_dates =
      {
        x: last_seven_days.map { |date| date.strftime("%d-%b") },
        y: seances_by_dates
      }
  end
end
