class CreateSession < EndState::Concluder
  def call
    session[:user_id] = user.id
  end

  def rollback
    session[:user_id] = nil
  end

  private

  def user
    params[:user]
  end

  def session
    params[:session]
  end
end
