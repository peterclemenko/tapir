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

puts "Seeding 'Findings Report'"
Tapir::ReportTemplate.create( 
:name => "Findings Report",
:content => <<-EOS
<p>
<b>Findings:</b>
  <ul>
  <% @entities.each do |t| %>
    <li><%= link_to t, tapir_entity_path(t.id.to_s) %></li>
  <% end %>
  </ul>
</p>
EOS
)

puts "Seeding 'Organization Report'"
Tapir::ReportTemplate.create( 
:name => "Organization Report",
:content => <<-EOS
<p>
<b>Organizations:</b>
  <p>
  <ul>
  <% @entities.each do |org| %>  
    <li><%= link_to org, tapir_entity_path(org.id.to_s) %></li>
    <ul>
    <% org.children.each do |child| %>
     <li><%= link_to child, tapir_entity_path(child.id.to_s) %></li>
      <ul>
      <% child.children.each do |grandchild| %>
       <li><%= link_to grandchild, tapir_entity_path(grandchild.id.to_s) %></li>
      <% end %>
      </ul>
    <% end %>
    </ul>
  <% end %>
  </ul>
  </p>
</p>
EOS
)

#puts 'SETTING UP DEFAULT USER LOGIN'
#user = Tapir::User.create!( 
#  :tenant_id => Tapir::Tenant.first,
#  :name => 'Tapir', 
#  :email => 'tapir@tapir.com', 
#  :password => 'tapir123', 
#  :password_confirmation => 'tapir123')
#puts 'New user created: ' << user.name