class UserFollow < EndState::StateMachine
  set_initial_state :not_following

  transition not_following: :following, as: :follow do |t|
    t.require_params :follower_id, :user_id
    t.guard FollowerIsNotUser
    t.guard RequireFollower
    t.guard RequireUser
    t.concluder FollowUser
  end
end
