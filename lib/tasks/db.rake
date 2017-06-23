namespace :db do

  desc 'Load the sample data from db/sample.rb'
  task :sample => :environment do
    seed_file = File.join(Rails.root, 'db', 'sample_data.rb')
    load(seed_file) if File.exist?(seed_file)
  end

  desc 'Drop, create, migrate, seed and sample_data'
  task :bootstrap => [:drop, :create, :migrate, :seed, :sample, 'test:prepare']
end

task :bs => "db:bootstrap"

