['northeast', 'westcoast', 'midwest'].each do |region|
  Bus.create(:name => region)
end

['whatsapp', 'twitter', 'facebook', 'github'].each do |startup_name|
  Team.create(:name => startup_name, :website => "#{startup_name}.com", :bus_id => 1,
              :twitter_handle => "@#{startup_name}", :facebook_url => "www.facebook.com/#{startup_name}",
              :github_url => "www.github.com/#{startup_name}", :description => "#{startup_name} is worth 20 billion dollars")
end

Buspreneur.create(email: "blane@gmail.com", username: "BC00", name: "Blane Cordes", password: "test1234")
Buspreneur.create(email: "blane1@gmail.com", username: "BJC00", name: "Bob Cord", password: "test1234", team_id: 1)
Buspreneur.create(email: "blane2@gmail.com", username: "thing00", name: "Boy Cordesss", password: "test1234")
