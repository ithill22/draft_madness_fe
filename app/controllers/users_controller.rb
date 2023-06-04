class UsersController < ApplicationController
  def new; end

  def create
    user_details = DraftMadnessService.new.register_user(user_params)
    redirect_to sessions_path(user_details)
  end

  def show

    @facade = UsersFacade.new(current_user)
  end

  private

  def user_params
    {
      name: name,
      email: email,
      google_id: google_id,
      auth_token: token
    }
  end

  def google_id
    request.env['omniauth.auth']['uid']
  end

  def email
    request.env['omniauth.auth']['info']['email']
  end

  def name
    request.env['omniauth.auth']['info']['name']
  end

  def token
    request.env['omniauth.auth']['credentials']['token']
  end
end
