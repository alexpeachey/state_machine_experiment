class AuthenticateUser < EndState::Guard

  def will_allow?
    user.authenticate params[:password]
  end

  def failed
    object.failure_messages << 'Password mismatch.'
  end

  private

  def user
    params[:user]
  end
end
