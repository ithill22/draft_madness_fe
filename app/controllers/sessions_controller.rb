class SessionsController < ApplicationController
  def create
    session[:user_id] = params[:data][:id]

    redirect_to users_dashboard_path
  end
end
