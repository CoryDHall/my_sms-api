class ApplicationController < ActionController::API
  private

  def current_user_session
    @current_user_session ||= UserSession.find_or_create(session[:user_session_id])
    session[:user_session_id] = @current_user_session.id
  end
end
