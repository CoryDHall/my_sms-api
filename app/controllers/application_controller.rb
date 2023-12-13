class ApplicationController < ActionController::API
  # default_format :json
  private

  def current_user_session
    @current_user_session ||= UserSession.find_or_create(session[:user_session_id])
    session[:user_session_id] = @current_user_session.id
    @current_user_session
  end
end
