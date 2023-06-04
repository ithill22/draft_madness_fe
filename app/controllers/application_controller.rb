# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @_current_user_id ||= session[:user_id]
  end
end
