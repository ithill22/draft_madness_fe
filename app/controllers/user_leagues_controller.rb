class UserLeaguesController < ApplicationController
  def show; end
  
  def new; end

  def create
    if params[:participants]
      params[:participants].each do |participant|
        UserLeaguesFacade.new.create_user_league({ league_id: params[:league].to_i, user_id: participant.to_i })
      end
    end
    redirect_to league_path(params[:league])
  end
end