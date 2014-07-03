class RequireUniqueUser < EndState::Guard
  attr_defaultable :user_repository, -> { User }
  attr_reader :duplicate_user, :duplicate_reason

  def will_allow?
    check_email or check_handle
    duplicate_user.nil?
  end

  def failed
    object.failure_messages << duplicate_reason
  end

  private

  def check_email
    @duplicate_user = user_repository.where(email: params[:email]).first
    @duplicate_reason = "Email #{params[:email]} is in use."
  end

  def check_handle
    @duplicate_user = user_repository.where(handle: params[:handle]).first
    @duplicate_reason = "Handle #{params[:handle]} is taken."
  end
end
