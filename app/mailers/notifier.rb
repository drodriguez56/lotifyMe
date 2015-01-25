class Notifier < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject:'welcome to lottifyme')
  end

  def email_for_past_draw(pick)
    @user = pick.user
    @pick = pick
    mail(to: @user.email, subject:'your resoult')
  end

  def email_for_future_draw(pick)
    @user = pick.user
    @pick = pick
     mail(to: @user.email, subject:'Request recived')
  end
end
