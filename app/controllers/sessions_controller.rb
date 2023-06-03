class SessionsController < ApplicationController
  def create
    session[:user_id] = params[:id]

    redirect_to users_dashboard_path
  end
end
