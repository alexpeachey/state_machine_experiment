class NotifyOriginalPoster < EndState::Concluder
  attr_defaultable :mailer, -> { UserMailer.notify_reply(user, post) }

  def call
    mailer.deliver
  end

  def rollback
  end

  private

  def user
    params[:original_poster]
  end

  def post
    params[:post]
  end
end
