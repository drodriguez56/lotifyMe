task :send_mail_test => :environment do
  user = User.find(1)
  Notifier.email_for_present_draw_user(user, "Powerball")
  puts "sent mail to test"
end