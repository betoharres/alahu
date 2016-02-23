Apartment::Tenant.switch!()
Rails.application.eager_load!
blacklist ||= ['Resource', 'User']
ActiveRecord::Base.descendants.map(&:name).each do |resource|
  unless resource.match(/::/) || blacklist.include?(resource)
    Resource.create! name: resource
  end
end
