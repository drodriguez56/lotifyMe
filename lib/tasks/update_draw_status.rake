task :update_status=> :environment do
  pics = Pick.where(result: nil)
  puts "results set"
  pics.each do |pick|
    pick.assign_draw_id
    pick.setresult
    pick.save
    p pick
  end
end