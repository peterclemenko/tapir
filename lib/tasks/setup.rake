require 'fileutils'

namespace :setup  do
  desc "initial setup"
  task :initial => :environment do
    
    # Running this assumes you've already put your database.yml into place
    # Otherwise, there would be no way to require 'environment' :(

    # puts "Copying database.yml into place..."
    # FileUtils.cp("#{Rails.root}/config/database.yml.sample", "#{Rails.root}/config/")    

    # Pull down geolitecity database
    puts "Getting Geolitecity database..."
    `#{Rails.root}/data/get_latest.sh` unless File.exists? "#{Rails.root}/data/latest.dat"

    # rake db:migrate
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke

  end
end
