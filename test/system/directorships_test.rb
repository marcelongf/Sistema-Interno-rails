require "application_system_test_case"

class DirectorshipsTest < ApplicationSystemTestCase
  setup do
    @directorship = directorships(:one)
  end

  test "visiting the index" do
    visit directorships_url
    assert_selector "h1", text: "Directorships"
  end

  test "creating a Directorship" do
    visit directorships_url
    click_on "New Directorship"

    fill_in "Director", with: @directorship.director
    fill_in "Name", with: @directorship.name
    click_on "Create Directorship"

    assert_text "Directorship was successfully created"
    click_on "Back"
  end

  test "updating a Directorship" do
    visit directorships_url
    click_on "Edit", match: :first

    fill_in "Director", with: @directorship.director
    fill_in "Name", with: @directorship.name
    click_on "Update Directorship"

    assert_text "Directorship was successfully updated"
    click_on "Back"
  end

  test "destroying a Directorship" do
    visit directorships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Directorship was successfully destroyed"
  end
end
