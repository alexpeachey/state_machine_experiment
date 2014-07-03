class SessionCreation < EndState::StateMachine
  set_initial_state :uncreated

  transition uncreated: :created, as: :create do |t|
    t.require_params :email, :password, :session
    t.guard RequireUser
    t.guard AuthenticateUser
    t.concluder CreateSession
  end
end
