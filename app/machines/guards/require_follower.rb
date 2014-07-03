class RequireFollower < EndState::Guard
  attr_defaultable :user_repository, -> { User }

  def will_allow?
    params[:follower] = user
    user.present?
  end

  def failed
    object.failure_messages << "Cannot find user for: #{params[:follower_id]}"
  end

  private

  def user
    @user ||= user_repository.find_by_id(params[:follower_id])
  end
end
