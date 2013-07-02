# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

setting_keys = [ 
   {:name => "linkedin_api_key", :visibility => "user"},
   {:name => "linkedin_secret_key", :visibility => "user"},
   {:name => "linkedin_auth", :visibility => "system"},
   {:name => "bing_api", :visibility => "user"},
   {:name => "google_api", :visibility => "user"},
   {:name => "corpwatch_api", :visibility => "user"}
]

setting_keys.each do |key| 
  puts "Seeding setting: #{key[:name]}"
  Tapir::Setting.create(key)
end

#puts 'SETTING UP DEFAULT USER LOGIN'
#user = Tapir::User.create!( 
#  :tenant_id => Tapir::Tenant.first,
#  :name => 'Tapir', 
#  :email => 'tapir@tapir.com', 
#  :password => 'tapir123', 
#  :password_confirmation => 'tapir123')
#puts 'New user created: ' << user.name