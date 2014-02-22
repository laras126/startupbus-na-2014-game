
['whatsapp', 'twitter', 'facebook', 'github'].each do |startup_name|
  Team.create(:name => "#{startup_name}", :website => "#{startup_name}.com", 
              :twitter_handle => "@#{startup_name}", :facebook_url => "www.facebook.com/#{startup_name}", 
              :github_url => "www.github.com/#{startup_name}", :description => "#{startup_name} is worth 20 billion dollars")
end

['northeast', 'westcoast', 'midwest'].each do |region|
  Bus.create(:name => region)
end

