class UsersController < ApplicationController
  def new; end

  def create
    auth_hash = request.env['omniauth.auth']
    google_id = auth_hash['uid']
    email = auth_hash['info']['email']
    name = auth_hash['info']['name']
    token = auth_hash['credentials']['token']
  end

  def dashboard; end
end