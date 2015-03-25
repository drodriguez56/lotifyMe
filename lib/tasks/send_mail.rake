task :send_mail_Powerball => :environment do
  puts "mail sent"
  user = User.new(username:'mimi', email: 'drodriguez@clunda.co', password:"12345")
  Notifier.welcome_email(user)
end