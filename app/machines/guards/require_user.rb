class RequireUser < EndState::Guard
  attr_defaultable :user_repository, -> { User }

  def will_allow?
    params[:user] = user
    user.present?
  end

  def failed
    object.failure_messages << "Cannot find user for: #{params[:user_id]}"
  end

  private

  def user
    @user ||= user_repository.find_by(id: params[:user_id]) ||
      user_repository.find_by(email: params[:email])
  end
end
