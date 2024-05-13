require "test_helper"

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get department_name" do
    get departments_department_name_url
    assert_response :success
  end
end
