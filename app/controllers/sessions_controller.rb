class SessionsController < ApplicationController
  def create
    session[:user_id] = params[:data][:attributes][:auth_token]

    redirect_to users_dashboard_path
  end
end
