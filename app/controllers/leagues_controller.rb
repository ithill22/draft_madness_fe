class LeaguesController < ApplicationController
  before_action :leagues_facade, only: [:create, :show]

  def new
    @users = UsersFacade.new.all_users
  end

  def create
    if !@lf.empty_params?(params)
      @user = UsersFacade.new(current_user).user
      league = @lf.new_league(league_params)
      redirect_to controller: 'user_leagues',
                    action: 'create',
                    participants: params[:participants],
                    league: league.id
    else
      flash[:error] = "Please fill in all fields."
      redirect_to new_league_path
    end
  end

  def show
    @league = @lf.league(params[:id])
  end

  private

  def league_params
    {
      name: params[:name],
      draft_date: format_date,
      draft_time: format_time,
      manager_id: @user.id
    }
  end

  def format_date
    Date.parse("#{params['day(1i)']}/#{params['day(2i)']}/#{params['day(3i)']}").to_fs(:long)
  end

  def format_time
    Time.parse("#{params['time(4i)']}:#{params['time(5i)']}").strftime("%-l:%M %P")
  end

  def leagues_facade
    @lf = LeaguesFacade.new
  end
end