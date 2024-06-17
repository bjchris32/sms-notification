require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "sign up get" do
    get signup_path
    puts "hello ! are you testing"
    assert_response :success
  end

  test "sign up post" do
  end
end
