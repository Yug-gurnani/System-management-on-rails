class MainCoursesController < ApplicationController
  before_action :set_main_course, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:index, :show]

  # GET /main_courses or /main_courses.json
  def index
    @main_courses = MainCourse.all
  end


  # GET /main_courses/1 or /main_courses/1.json
  def show
    @user = Admin.all
  end
  
  def enroll
  
    c = params[:c]
    course = MainCourse.find(c)
    seats = course.seats
    if seats > 0 
      if !Subscription.where(user_id: current_admin.id ,course_id: c).exists?
        s = Subscription.new
        s.update_attribute(:user_id, current_admin.id)
        s.update_attribute(:course_id, c)
        redirect_to request.referrer, :notice => "You are enrolled in this course!"
        course.seats = course.seats - 1
        course.save!
      else
        redirect_to request.referrer, :notice => "You are Already enrolled in this course!"
      end
    else
      redirect_to request.referrer, :notice => "No seats Available in this course"
    end
  end

  def deenroll
    c = params[:c]
    course = MainCourse.find(c)
    if Subscription.where(user_id: current_admin.id ,course_id: c).exists?
      Subscription.where(user_id:current_admin.id, course_id:c).destroy_all
      redirect_to request.referrer, :notice => "You are de-enrolled from this course!"
      course.seats = course.seats+1
      course.save!
    else
      redirect_to request.referrer, :notice => "You are Not enrolled in this course!"
    end
  end

  

  # GET /main_courses/new
  def new
    @main_course = MainCourse.new
  end

  # GET /main_courses/1/edit
  def edit
  end

  # POST /main_courses or /main_courses.json
  def create
    @main_course = MainCourse.new(main_course_params)

    respond_to do |format|
      if @main_course.save
        format.html { redirect_to @main_course, notice: "Main course was successfully created." }
        format.json { render :show, status: :created, location: @main_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @main_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main_courses/1 or /main_courses/1.json
  def update
    respond_to do |format|
      if @main_course.update(main_course_params)
        format.html { redirect_to @main_course, notice: "Main course was successfully updated." }
        format.json { render :show, status: :ok, location: @main_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @main_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main_courses/1 or /main_courses/1.json
  def destroy
    @main_course.destroy
    respond_to do |format|
      format.html { redirect_to main_courses_url, notice: "Main course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_course
      @main_course = MainCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_course_params
      params.require(:main_course).permit(:course_name, :course_id, :course_videos, :seats, :description,:enrolled)
    end
end
