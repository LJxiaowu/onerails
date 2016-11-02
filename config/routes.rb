Rails.application.routes.draw do
  get 'satic_pages/home'

  get 'satic_pages/help'

  root 'application#hello'
end
