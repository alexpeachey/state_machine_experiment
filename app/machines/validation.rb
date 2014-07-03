class Validation < EndState::StateMachine
  store_states_as_strings!
  state_attribute :validation_state

  transition unvalidated: :validated, as: :validate do |t|
    t.persistence_on
  end
end
