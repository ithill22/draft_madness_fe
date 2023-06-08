class LeaguesController < ApplicationController
  def new
    @users_facade = UsersFacade.new
  end

  def create
    if empty_params?(params)
      flash[:error] = 'Please fill in all fields.'
      redirect_to new_league_path
    elsif !seven_players(params[:participants])
      flash[:error] = 'Please choose 7 players.'
      redirect_to new_league_path
    else
      league = LeaguesFacade.new.new_league(league_params)
      redirect_to controller: 'user_leagues',
                  action: 'create',
                  participants: params[:participants],
                  league: league.id
    end
  end

  def show
    @facade = LeaguesFacade.new(params[:id])
  end

  def draft; end

  private

  def league_params
    {
      name: params[:name],
      draft_date: format_date,
      draft_time: format_time,
      manager_id: current_user
    }
  end

  def empty_params?(params)
    params.each do |k, _|
      return true unless params[k].present?
    end
    false
  end

  def seven_players(participants)
    participants.count == 7
  end

  def format_date
    Date.parse("#{params['day(1i)']}/#{params['day(2i)']}/#{params['day(3i)']}").to_fs(:long)
  end

  def format_time
    Time.parse("#{params['time(4i)']}:#{params['time(5i)']}").strftime("%-l:%M %P")
  end
end
