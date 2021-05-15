class Subscription < ApplicationRecord
    belongs_to :admin, optional: true
    belongs_to :main_course, optional: true
end
