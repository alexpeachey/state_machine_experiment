class FollowerIsNotUser < EndState::Guard

  def will_allow?
    params[:follower_id].to_i != params[:user_id].to_i
  end

  def failed
    object.failure_messages << "Cannot follow yourself"
  end
end
