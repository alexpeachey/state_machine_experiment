class RequireValidatedUser < EndState::Guard

  def will_allow?
    Validation.new(user).validated?
  end

  def failed
    object.failure_messages << "You must validate!"
  end

  private

  def user
    params[:user]
  end
end
