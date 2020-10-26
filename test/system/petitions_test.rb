require "application_system_test_case"

class PetitionsTest < ApplicationSystemTestCase
  setup do
    @petition = petitions(:one)

    @admin_user = AdminUser.create!(
      email: "test@example.org",
      password: "system tests",
      password_confirmation: "system tests",
    )

    visit new_admin_user_session_url
    fill_in "Email", with: "test@example.org"
    fill_in "Password", with: "system tests"
    click_on "Log in"
  end

  test "visiting the index" do
    visit petitions_url
    assert_selector "h1", text: "Petitions"
  end

  test "creating a Petition" do
    visit petitions_url
    click_on "New Petition"

    fill_in "Body", with: @petition.body
    fill_in "Letter", with: @petition.letter
    fill_in "Title", with: @petition.title
    click_on "Create Petition"

    assert_text "Petition was successfully created"
  end

  test "updating a Petition" do
    visit petition_url(@petition)
    click_on "Edit this petition"

    fill_in "Body", with: @petition.body
    fill_in "Letter", with: @petition.letter
    fill_in "Title", with: @petition.title
    click_on "Update Petition"

    assert_text "Petition was successfully updated"
  end

  test "signing a petition" do
    visit petition_url(@petition)

    assert_text "No signatures yet!"
    fill_in "signature_name", with: "Bill R"
    click_on "Sign"

    assert_text "1 signature so far"
  end
end
