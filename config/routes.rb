Rails.application.routes.draw do
  api_version(module: "V1",
              header: {
                name: "Accept",
                value: "application/vnd.mycompany+json; version=1",
                defaults: {:format => :json}
              }) do
    with_options(except: [:new, :edit]) do |opt|
      opt.resources :companies
      opt.resources :roles
      opt.resources :permissions
      resources :gateway_roles
      resources :user_roles
      resources :firmwares
      resources :configs
      resources :nodes
      resources :networks
      resources :tasks
      as :gateway do
        opt.resources :gateways
      end
    end
    resources :lamp_stats, except: [:new, :edit, :update]
  end

  mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'Gateway', at: 'gateway_auth',
          skip: [:omniauth_callbacks, :confirmations, :passwords, :registerable]
end
