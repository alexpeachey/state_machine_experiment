class UserCreation < EndState::StateMachine
  set_initial_state :uncreated

  transition uncreated: :created, as: :create do |t|
    t.require_params :email, :password, :handle, :session
    t.guard RequireUniqueUser
    t.concluder CreateUser
    t.concluder ValidateUserEmail
    t.concluder CreateSession
  end
end
