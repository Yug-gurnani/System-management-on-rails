class MainCourse < ApplicationRecord
    has_many :subscriptions
    has_many :admins, through: :subscriptions 
end
