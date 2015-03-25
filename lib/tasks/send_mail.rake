task :send_mail_Powerball => :environment do
  picks = Pick.where(game: 'Powerball', draw_date: Date.today) # make sure is today and not yesterday
  if picks.length > 0
    arr = []
    picks.each do |pick|
      User.where( id: pick.user_id ).each{ |user| arr << user}
    end
    if arr.length > 0
      Notifier.email_for_present_draw_users(arr.uniq)
     end
  end
  puts "mail sent to all Powerball players"
end