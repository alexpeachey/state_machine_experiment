class ValidateUserEmail < EndState::Concluder
  attr_defaultable :mailer, -> { UserMailer.validation(user) }

  def call
    mailer.deliver
  end

  def rollback
  end

  private

  def user
    params[:user]
  end
end
