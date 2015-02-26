VisitScheduler::Application.routes.draw do
  get "visits", to: 'visits#index'
  match "visits", to: 'visits#create', via: [:post, :options]
  match "visits/:id", to: 'visits#destroy', via: [:delete, :options]
end
