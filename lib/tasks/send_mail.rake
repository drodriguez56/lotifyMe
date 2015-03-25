task :send_mail_powerball => :environment do
  picks = Pick.where(game: 'Powerball', draw_date: Date.today) # make sure is today and not yesterday
  if picks.length > 0
    arr = []
    picks.each do |pick|
      User.where( id: pick.user_id ).each{ |user| arr << user}
    end
    if arr.uniq.length > 0
        arr.uniq.each do |user|
          Notifier.email_for_present_draw_user(user, 'Powerball')
        end
     end
  end
  puts "mail sent to all Powerball players"
end

task :send_mail_mega_million => :environment do
  picks = Pick.where(game: 'MegaMillion', draw_date: Date.today) # make sure is today and not yesterday
  if picks.length > 0
    arr = []
    picks.each do |pick|
      User.where( id: pick.user_id ).each{ |user| arr << user}
    end
    if arr.uniq.length > 0
        arr.uniq.each do |user|
          Notifier.email_for_present_draw_user(user, 'MegaMillion')
        end
     end
  end
  puts "mail sent to all MegaMillion players"
end

task :send_mail_ny_loto => :environment do
  picks = Pick.where(game: 'NyLotto', draw_date: Date.today) # make sure is today and not yesterday
  if picks.length > 0
    arr = []
    picks.each do |pick|
      User.where( id: pick.user_id ).each{ |user| arr << user}
    end
    if arr.uniq.length > 0
        arr.uniq.each do |user|
          Notifier.email_for_present_draw_user(user, 'NyLotto')
        end
     end
  end
  puts "mail sent to all NyLotto players"
end

task :send_mail_cash_4_life => :environment do
  picks = Pick.where(game: 'Cash4Life', draw_date: Date.today) # make sure is today and not yesterday
  if picks.length > 0
    arr = []
    picks.each do |pick|
      User.where( id: pick.user_id ).each{ |user| arr << user}
    end
    if arr.uniq.length > 0
        arr.uniq.each do |user|
          Notifier.email_for_present_draw_user(user, 'Cash4Life')
        end
     end
  end
  puts "mail sent to all Cash4Life players"
end