class SessionsController < ApplicationController

  def create
    session[:user_id] = params[:data][:id]
    redirect_to users_dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
