require "application_system_test_case"

class MainCoursesTest < ApplicationSystemTestCase
  setup do
    @main_course = main_courses(:one)
  end

  test "visiting the index" do
    visit main_courses_url
    assert_selector "h1", text: "Main Courses"
  end

  test "creating a Main course" do
    visit main_courses_url
    click_on "New Main Course"

    fill_in "Course", with: @main_course.course_id
    fill_in "Course name", with: @main_course.course_name
    fill_in "Course videos", with: @main_course.course_videos
    fill_in "Seats", with: @main_course.seats
    click_on "Create Main course"

    assert_text "Main course was successfully created"
    click_on "Back"
  end

  test "updating a Main course" do
    visit main_courses_url
    click_on "Edit", match: :first

    fill_in "Course", with: @main_course.course_id
    fill_in "Course name", with: @main_course.course_name
    fill_in "Course videos", with: @main_course.course_videos
    fill_in "Seats", with: @main_course.seats
    click_on "Update Main course"

    assert_text "Main course was successfully updated"
    click_on "Back"
  end

  test "destroying a Main course" do
    visit main_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Main course was successfully destroyed"
  end
end
