# frozen_string_literal: true

Rails.application.routes.draw do
  resources :binaries_conversion, only: :index
end
