class PostList < EndState::StateMachine
  set_initial_state :empty

  transition empty: :full, as: :list do |t|
    t.require_params :user_id
    t.guard RequireUser
    t.concluder FindPosts
  end
end
