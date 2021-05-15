Rails.application.routes.draw do
  devise_for :admins
  resources :main_courses
  root 'home#base_my_courses'
  get 'home/about'
  get 'home/index_students'
  get 'main_courses/index'
  post 'main_courses/enroll'
  post 'main_courses/deenroll'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
