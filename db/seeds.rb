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

puts "Removing Reports"
Tapir::ReportTemplate.all.each {|x| x.destroy }

puts "Seeding Reports"
Tapir::ReportTemplate.create( 
  :name => "organizations", 
  :pretty_name => "Organization List",
  :template => "list",
  :setup => "@entities = Tapir::Entities::Organization.all")

Tapir::ReportTemplate.create( 
  :name => "hosts", 
  :template => "list", 
  :pretty_name => "Host List",
  :setup => "@entities = Tapir::Entities::Host.all")

Tapir::ReportTemplate.create( 
  :name => "findings",
  :pretty_name => "Finding List", 
  :template => "list",
  :setup => "@entities = Tapir::Entities::Finding.all")

Tapir::ReportTemplate.create( 
  :name => "children",
  :pretty_name => "Children", 
  :template => "show_children",
  :setup => "@entities = Tapir::Entities::Base.all")

Tapir::ReportTemplate.create( 
  :name => "children_by_organization", 
  :pretty_name => "Children by Organization",
  :template => "show_children",
  :setup => "@entities = Tapir::Entities::Organization.all")

Tapir::ReportTemplate.create( 
  :name => "children_by_host",
  :pretty_name => "Children by Host", 
  :template => "show_children",
  :setup => "@entities = Tapir::Entities::Host.all")

Tapir::ReportTemplate.create( 
  :name => "children_by_findings", 
  :pretty_name => "Children by Finding", 
  :template => "show_children",
  :setup => "@entities = Tapir::Entities::Finding.all")

Tapir::ReportTemplate.create( 
  :name => "children_by_physical_locations",
  :pretty_name => "Children by Physical Location", 
  :template => "show_children",
  :setup => "@entities = Tapir::Entities::PhysicalLocation.all")

Tapir::ReportTemplate.create( 
  :name => "parents_by_physical_locations",
  :pretty_name => "Parents by Physical Location", 
  :template => "show_parents",
  :setup => "@entities = Tapir::Entities::PhysicalLocation.all")

Tapir::ReportTemplate.create( 
  :name => "parents_by_domain",
  :pretty_name => "Parents by Domain", 
  :template => "show_parents",
  :setup => "@entities = Tapir::Entities::Domain.all")

Tapir::ReportTemplate.create( 
  :name => "parents_by_host",
  :pretty_name => "Parents by Host", 
  :template => "show_parents",
  :setup => "@entities = Tapir::Entities::Host.all")

Tapir::ReportTemplate.create( 
  :name => "parents_by_web_application",
  :pretty_name => "Parents by Web Application", 
  :template => "show_parents",
  :setup => "@entities = Tapir::Entities::WebApplication.all")

Tapir::ReportTemplate.create( 
  :name => "parents_by_web_page",
  :pretty_name => "Parents by Web Page", 
  :template => "show_parents",
  :setup => "@entities = Tapir::Entities::WebPage.all")

Tapir::ReportTemplate.create( 
  :name => "peeping_tom", 
  :pretty_name => "Peeping Tom", 
  :template => "peeping_tom",
  :setup => "@entities = Tapir::Entities::Image.all")

#puts 'SETTING UP DEFAULT USER LOGIN'
#user = Tapir::User.create!( 
#  :tenant_id => Tapir::Tenant.first,
#  :name => 'Tapir', 
#  :email => 'tapir@tapir.com', 
#  :password => 'tapir123', 
#  :password_confirmation => 'tapir123')
#puts 'New user created: ' << user.name