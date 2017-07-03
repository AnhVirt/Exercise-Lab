require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get title" do
    get photos_title_url
    assert_response :success
  end

end
