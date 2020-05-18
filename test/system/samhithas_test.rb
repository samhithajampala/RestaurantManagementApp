require "application_system_test_case"

class SamhithasTest < ApplicationSystemTestCase
  setup do
    @samhitha = samhithas(:one)
  end

  test "visiting the index" do
    visit samhithas_url
    assert_selector "h1", text: "Samhithas"
  end

  test "creating a Samhitha" do
    visit samhithas_url
    click_on "New Samhitha"

    click_on "Create Samhitha"

    assert_text "Samhitha was successfully created"
    click_on "Back"
  end

  test "updating a Samhitha" do
    visit samhithas_url
    click_on "Edit", match: :first

    click_on "Update Samhitha"

    assert_text "Samhitha was successfully updated"
    click_on "Back"
  end

  test "destroying a Samhitha" do
    visit samhithas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Samhitha was successfully destroyed"
  end
end
