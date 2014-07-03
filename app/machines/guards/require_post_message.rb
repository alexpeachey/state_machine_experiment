class RequirePostMessage < EndState::Guard
  attr_defaultable :require_reply_message, -> { RequireReplyMessage.new(object, state, params) }

  def will_allow?
    !require_reply_message.will_allow?
  end
end
