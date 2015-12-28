Rails.application.eager_load!
blacklist ||= ['Resource', 'User']
ActiveRecord::Base.descendants.map(&:name).each do |resource|
  Resource.create! name: resource unless resource.match(/::/) || blacklist.include?(resource)
end
