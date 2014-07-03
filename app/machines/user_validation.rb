class UserValidation < EndState::StateMachine
  set_initial_state :unvalidated

  transition unvalidated: :validated, as: :validate do |t|
    t.require_params :validation_token, :session
    t.guard RequireUserHasToken
    t.concluder ValidateUser
    t.concluder CreateSession
  end
end
