class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url= 'http://example.com/login'
    mail(to: @user.email, subject:'welcome to lottifyme')
  end
end
