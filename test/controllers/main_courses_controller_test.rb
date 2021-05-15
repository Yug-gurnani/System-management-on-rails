require "test_helper"

class MainCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_course = main_courses(:one)
  end

  test "should get index" do
    get main_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_main_course_url
    assert_response :success
  end

  test "should create main_course" do
    assert_difference('MainCourse.count') do
      post main_courses_url, params: { main_course: { course_id: @main_course.course_id, course_name: @main_course.course_name, course_videos: @main_course.course_videos, seats: @main_course.seats } }
    end

    assert_redirected_to main_course_url(MainCourse.last)
  end

  test "should show main_course" do
    get main_course_url(@main_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_course_url(@main_course)
    assert_response :success
  end

  test "should update main_course" do
    patch main_course_url(@main_course), params: { main_course: { course_id: @main_course.course_id, course_name: @main_course.course_name, course_videos: @main_course.course_videos, seats: @main_course.seats } }
    assert_redirected_to main_course_url(@main_course)
  end

  test "should destroy main_course" do
    assert_difference('MainCourse.count', -1) do
      delete main_course_url(@main_course)
    end

    assert_redirected_to main_courses_url
  end
end
