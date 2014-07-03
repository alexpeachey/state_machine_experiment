class UserLocation < EndState::StateMachine
  set_initial_state :not_found

  transition not_found: :found, as: :find do |t|
    t.require_params :user_id
    t.guard RequireUser
  end
end
