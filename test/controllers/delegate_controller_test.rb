require 'test_helper'

class DelegateControllerTest < ActionDispatch::IntegrationTest
  test "should get generate_url" do
    get delegate_generate_url_url
    assert_response :success
  end

end
