class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :current_sub
  
  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end
  
  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_login
    redirect_to new_session_url unless logged_in?
  end
  
  def require_logout
    redirect_to user_url(current_user) if logged_in?
  end
  
  def is_moderator?
    current_user.id == Sub.find_by(id: params[:id]).user_id  
  end
  
  def require_moderator
    redirect_to sub_url(params[:id]) unless is_moderator?
  end

end
