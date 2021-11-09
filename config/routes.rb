# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :congestion do
        get 'meetings/:id', to: 'cameras#index'
      end
      namespace :reserve do
        get 'meetings/:id', to: 'calendars#index'
      end
    end
  end
end
