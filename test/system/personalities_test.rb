require "application_system_test_case"

class PersonalitiesTest < ApplicationSystemTestCase
  setup do
    @personality = personalities(:one)
  end

  test "visiting the index" do
    visit personalities_url
    assert_selector "h1", text: "Personalities"
  end

  test "should create personality" do
    visit personalities_url
    click_on "New personality"

    fill_in "Contact number", with: @personality.contact_number
    fill_in "Email", with: @personality.email
    fill_in "First name", with: @personality.first_name
    fill_in "Last name", with: @personality.last_name
    click_on "Create Personality"

    assert_text "Personality was successfully created"
    click_on "Back"
  end

  test "should update Personality" do
    visit personality_url(@personality)
    click_on "Edit this personality", match: :first

    fill_in "Contact number", with: @personality.contact_number
    fill_in "Email", with: @personality.email
    fill_in "First name", with: @personality.first_name
    fill_in "Last name", with: @personality.last_name
    click_on "Update Personality"

    assert_text "Personality was successfully updated"
    click_on "Back"
  end

  test "should destroy Personality" do
    visit personality_url(@personality)
    click_on "Destroy this personality", match: :first

    assert_text "Personality was successfully destroyed"
  end
end
