# Below are the routes for madmin
namespace :madmin do
  resources :messages
  root to: "dashboard#show"
end
