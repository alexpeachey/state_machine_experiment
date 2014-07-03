class UserUnfollow < EndState::StateMachine
  set_initial_state :following

  transition following: :not_following, as: :unfollow do |t|
    t.require_params :follower_id, :user_id
    t.guard RequireFollower
    t.guard RequireUser
    t.guard RequireRelationship
    t.concluder UnfollowUser
  end
end
