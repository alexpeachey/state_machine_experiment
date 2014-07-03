class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  protected

  def current_user
    return @current_user unless session[:user_id].present?
    @current_user ||= if current_user_machine.find! current_user_params
      current_user_params[:user]
    end
  end

  def authenticate!
    redirect_to new_user_path unless current_user.present?
  end

  def current_user_params
    @current_user_params ||= {
      user_id: session[:user_id]
    }
  end

  def current_user_machine
    UserLocation.new(LogicalState.new)
  end
end
