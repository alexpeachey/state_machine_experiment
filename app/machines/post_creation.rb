class PostCreation < EndState::StateMachine
  set_initial_state :uncreated

  transition uncreated: :post_created, as: :create_post do |t|
    t.require_params :user_id, :message
    t.guard RequireUser
    t.guard RequireValidatedUser
    t.guard RequirePostMessage
    t.concluder CreatePost
  end

  transition uncreated: :reply_created, as: :create_reply do |t|
    t.require_params :user_id, :message
    t.guard RequireUser
    t.guard RequireValidatedUser
    t.guard RequireReplyMessage
    t.concluder CreatePost
    t.concluder NotifyOriginalPoster
  end
end
