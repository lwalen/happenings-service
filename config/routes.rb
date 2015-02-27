HappeningsService::Application.routes.draw do
  get "happenings", to: 'happenings#index'
  match "happenings", to: 'happenings#create', via: [:post, :options]
  match "happenings/:id", to: 'happenings#destroy', via: [:delete, :options]
end
