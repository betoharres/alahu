namespace :db do
  desc 'Also create shared_extensions Schema'
  task :extensions => :environment  do
    # Create Schema
    ActiveRecord::Base.connection.execute 'CREATE SCHEMA IF NOT EXISTS shared_extensions;'
    # Enable Unaccent
    ActiveRecord::Base.connection.execute 'CREATE EXTENSION IF NOT EXISTS "unaccent" SCHEMA shared_extensions;'
    puts "Enabled UNACCENT"
    # Enable citext
    ActiveRecord::Base.connection.execute 'CREATE EXTENSION IF NOT EXISTS "citext" SCHEMA shared_extensions;'
    puts "Enabled CITEXT"
    # Enable UUID-OSSP
    ActiveRecord::Base.connection.execute 'CREATE EXTENSION IF NOT EXISTS "pgcrypto" SCHEMA shared_extensions;'
    puts "Enabled UUID-OSSP"
    # Enable POSTGIS
    ActiveRecord::Base.connection.execute 'CREATE EXTENSION IF NOT EXISTS "postgis" SCHEMA shared_extensions;'
    puts "Enabled POSTGIS"
  end
end

Rake::Task["db:create"].enhance do
  Rake::Task["db:extensions"].invoke
end

Rake::Task["db:test:purge"].enhance do
  Rake::Task["db:extensions"].invoke
end
