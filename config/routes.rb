Rails.application.routes.draw do
  get 'settings/show'
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  resource 'events'
  resource 'grades'
  resource 'time_tables'
  resource 'settings'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
