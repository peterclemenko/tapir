# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Removing Reports"
ReportTemplate.all.each {|x| x.destroy }

puts "Seeding Reports"

ReportTemplate.create( 
  :name => "all", 
  :pretty_name => "All Entities List",
  :template => "list",
  :setup => "@entities = Entities::Base.all")

ReportTemplate.create( 
  :name => "organizations", 
  :pretty_name => "Organization List",
  :template => "list",
  :setup => "@entities = Entities::Organization.all")

ReportTemplate.create( 
  :name => "hosts", 
  :template => "list", 
  :pretty_name => "Host List",
  :setup => "@entities = Entities::Host.all")

ReportTemplate.create( 
  :name => "findings",
  :pretty_name => "Finding List", 
  :template => "list",
  :setup => "@entities = Entities::Finding.all")

ReportTemplate.create( 
  :name => "children",
  :pretty_name => "Children", 
  :template => "show_children",
  :setup => "@entities = Entities::Base.all")

ReportTemplate.create( 
  :name => "children_by_organization", 
  :pretty_name => "Children by Organization",
  :template => "show_children",
  :setup => "@entities = Entities::Organization.all")

ReportTemplate.create( 
  :name => "children_by_host",
  :pretty_name => "Children by Host", 
  :template => "show_children",
  :setup => "@entities = Entities::Host.all")

ReportTemplate.create( 
  :name => "children_by_domain",
  :pretty_name => "Children by Domain", 
  :template => "show_children",
  :setup => "@entities = Entities::Domain.all")

ReportTemplate.create( 
  :name => "children_by_findings", 
  :pretty_name => "Children by Finding", 
  :template => "show_children",
  :setup => "@entities = Entities::Finding.all")

ReportTemplate.create( 
  :name => "children_by_physical_locations",
  :pretty_name => "Children by Physical Location", 
  :template => "show_children",
  :setup => "@entities = Entities::PhysicalLocation.all")

ReportTemplate.create( 
  :name => "children_by_person", 
  :pretty_name => "Children by Person",
  :template => "show_children",
  :setup => "@entities = Entities::Person.all")

ReportTemplate.create( 
  :name => "parents_by_physical_locations",
  :pretty_name => "Parents by Physical Location", 
  :template => "show_parents",
  :setup => "@entities = Entities::PhysicalLocation.all")

ReportTemplate.create( 
  :name => "parents_by_domain",
  :pretty_name => "Parents by Domain", 
  :template => "show_parents",
  :setup => "@entities = Entities::Domain.all")

ReportTemplate.create( 
  :name => "parents_by_host",
  :pretty_name => "Parents by Host", 
  :template => "show_parents",
  :setup => "@entities = Entities::Host.all")

ReportTemplate.create( 
  :name => "parents_by_web_application",
  :pretty_name => "Parents by Web Application", 
  :template => "show_parents",
  :setup => "@entities = Entities::WebApplication.all")

ReportTemplate.create( 
  :name => "parents_by_web_page",
  :pretty_name => "Parents by Web Page", 
  :template => "show_parents",
  :setup => "@entities = Entities::WebPage.all")

ReportTemplate.create( 
  :name => "peeping_tom", 
  :pretty_name => "Peeping Tom", 
  :template => "peeping_tom",
  :setup => "@entities = Entities::Image.all")

User.all.each{|u| u.destroy}

Tenant.each do |t|
  user = User.where(:tenant_id => t.id) 
  if user.count == 0  
    puts "could not find a user for tenant #{t.host}"
    account_name = "#{t.host.split(".").first}"
    account_email = "#{account_name}@tapirrecon.com"
    puts "using account name #{account_name}"
    user = User.create!( 
      :tenant_id => t.id,
      :name => "#{account_name}", 
      :email => "#{account_email}", 
      :password => 'tapir123', 
      :password_confirmation => 'tapir123')
    puts 'New user created: ' << user.name
  else
    puts "found user for #{t.host}"
  end
end
