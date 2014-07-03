class RequireUserHasToken < EndState::Guard
  attr_defaultable :user_repository, -> { User }

  def will_allow?
    params[:user] = user
    user.present?
  end

  def failed
    object.failure_messages << "Cannot validate."
  end

  private

  def user
    @user ||= user_repository.find_by_validation_token(params[:validation_token])
  end
end
