BoozeEpoque::Application.routes.draw do
  root via: 'get',      to: 'application#index'
  post 'event_inquiry', to: 'application#event_inquiry'
  post 'contact',       to: 'application#contact'
end

