class LeaguesController < ApplicationController
  def new
    @users_facade = UsersFacade.new
  end

  def create
    if empty_params?
      empty_params_error
    elsif !seven_players
      less_than_7_error
    else
      create_new_user_league
    end
  end

  def show
    @facade = LeaguesFacade.new(params[:id])
  end

  def draft
    @facade = DraftFacade.new(params[:league_id])
  end

  private

  def league_params
    {
      name: params[:name],
      draft_date: format_date,
      draft_time: format_time,
      manager_id: current_user
    }
  end

  def create_new_user_league
    league = LeaguesFacade.new.new_league(league_params)
    redirect_to controller: 'user_leagues',
                action: 'create',
                participants: params[:participants],
                league: league.id
  end

  def empty_params?
    params.each do |k, _|
      return true unless params[k].present?
    end
    false
  end
    
  def empty_params_error
    flash[:error] = 'Please fill in all fields.'
    redirect_to new_league_path
  end

  def seven_players
    params[:participants].count == 7
  end

  def less_than_7_error
    flash[:error] = 'Please choose 7 players.'
    redirect_to new_league_path
  end

  def format_date
    Date.parse("#{params['day(1i)']}/#{params['day(2i)']}/#{params['day(3i)']}").to_fs(:long)
  end

  def format_time
    Time.parse("#{params['time(4i)']}:#{params['time(5i)']}").strftime('%-l:%M %P')
  end
end
