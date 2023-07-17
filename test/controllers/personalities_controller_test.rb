require "test_helper"

class PersonalitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personality = personalities(:one)
  end

  test "should get index" do
    get personalities_url
    assert_response :success
  end

  test "should get new" do
    get new_personality_url
    assert_response :success
  end

  test "should create personality" do
    assert_difference("Personality.count") do
      post personalities_url, params: { personality: { contact_number: @personality.contact_number, email: @personality.email, first_name: @personality.first_name, last_name: @personality.last_name } }
    end

    assert_redirected_to personality_url(Personality.last)
  end

  test "should show personality" do
    get personality_url(@personality)
    assert_response :success
  end

  test "should get edit" do
    get edit_personality_url(@personality)
    assert_response :success
  end

  test "should update personality" do
    patch personality_url(@personality), params: { personality: { contact_number: @personality.contact_number, email: @personality.email, first_name: @personality.first_name, last_name: @personality.last_name } }
    assert_redirected_to personality_url(@personality)
  end

  test "should destroy personality" do
    assert_difference("Personality.count", -1) do
      delete personality_url(@personality)
    end

    assert_redirected_to personalities_url
  end
end
