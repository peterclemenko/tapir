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
  :name => "children_by_dns_record",
  :pretty_name => "Children by DNS Record", 
  :template => "show_children",
  :setup => "@entities = Entities::DnsRecord.all")

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
  :name => "parents_by_dns_record",
  :pretty_name => "Parents by DNS Record", 
  :template => "show_parents",
  :setup => "@entities = Entities::DnsRecord.all")

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

Tenant.each do |t|
  # Set the current tenant, so the user is saved correctly (it's tenant-scoped)
  Tenant.current = t

  # Check to see if we have any users available for this tenant
  if User.count == 0
    puts "Could not find a user for tenant #{t.host}"
    account_name = "#{t.host.split(".").first}"
    account_email = "#{account_name}@tapirrecon.com"
    puts "Creating a user with name: #{account_name} and email: #{account_email}"
    user = User.create!( 
      :name => account_name, 
      :email => account_email, 
      :password => 'tapir123', 
      :password_confirmation => 'tapir123')
    puts "Created user #{user.email} for tenant #{t.host}"
  else
    puts "User exists for tenant #{t.host}"
  end
end
