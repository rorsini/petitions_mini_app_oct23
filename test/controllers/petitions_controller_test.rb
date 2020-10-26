require 'test_helper'

class PetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @petition = petitions(:one)
  end

  test "should get index" do
    get petitions_url
    assert_response :success
  end

  test "should show petition" do
    get petition_url(@petition)
    assert_response :success
  end
end
