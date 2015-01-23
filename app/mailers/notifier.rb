class Notifier < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject:'welcome to lottifyme')
  end
end
