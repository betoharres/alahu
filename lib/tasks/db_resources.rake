namespace :db do
  desc 'Keeps a table with the app\'s resources'
  task :resources => :environment  do
    blacklist ||= ['Resource']
    ActiveRecord::Base.descendants.map(&:name).each do |resource|
      Resource.all.each do |record|
        unless record.name.match(/#{resource}/i)
          Resource.create! name: resource unless resource.match(/::/) ||
                                          blacklist.include?(resource)
        end
      end
    end
  end
end

Rake::Task["db:migrate"].enhance do
  Rake::Task["db:resources"].invoke
end
