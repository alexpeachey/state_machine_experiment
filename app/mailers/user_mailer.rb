class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def validation(user)
    @user = user
    mail(to: user.email, subject: 'Please Validate')
  end

  def notify_reply(user, post)
    @user = user
    @post = post
    mail(to: user.email, subject: 'Someone replied to your drivel')
  end
end
