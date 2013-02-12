class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def build_cookie(user)
    cookies[:user_id] = user.id
    user.update_attributes(session_token: SecureRandom.uuid)
    cookies[:session_token] = user.session_token
  end

  def current_user
    return nil if cookies[:user_id].blank?
    return nil if cookies[:session_token].blank?
    user = User.find_by_session_token(cookies[:session_token])
    return nil unless user
    return nil if cookies[:user_id].to_i != user.id
    user
  end
end
