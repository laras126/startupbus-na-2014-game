['northeast', 'westcoast', 'midwest'].each do |region|
  Bus.create(:name => region)
end

['whatsapp', 'twitter', 'facebook', 'github'].each do |startup_name|
  Team.create(:name => "#{startup_name}", :website => "#{startup_name}.com", :bus_id => 1,
              :twitter_handle => "@#{startup_name}", :facebook_url => "www.facebook.com/#{startup_name}", 
              :github_url => "www.github.com/#{startup_name}", :description => "#{startup_name} is worth 20 billion dollars")
end

User.create(email: "blane@gmail.com", first_name: "Blane", last_name: "Cordes", username: "BC00", name: "Blane Cordes", password: "test1234")
User.create(email: "blane1@gmail.com", first_name: "Bob", last_name: "Cord", username: "BJC00", name: "Bob Cord", password: "test1234", team_id: 1, team_status: "pending")
User.create(email: "blane2@gmail.com", first_name: "Boy", last_name: "Cordesss", username: "thing00", name: "Boy Cordesss", password: "test1234")

