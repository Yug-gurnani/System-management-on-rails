class HomeController < ApplicationController
  before_action :authenticate_admin!, except: [:base,:about]
  def base_my_courses
    @main_courses = MainCourse.all
  end

  def about
  end

  def index_students
    @users = Admin.all
  end
end
