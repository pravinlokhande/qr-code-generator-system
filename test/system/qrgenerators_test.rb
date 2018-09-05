require "application_system_test_case"

class QrgeneratorsTest < ApplicationSystemTestCase
  setup do
    @qrgenerator = qrgenerators(:one)
  end

  test "visiting the index" do
    visit qrgenerators_url
    assert_selector "h1", text: "Qrgenerators"
  end

  test "creating a Qrgenerator" do
    visit qrgenerators_url
    click_on "New Qrgenerator"

    click_on "Create Qrgenerator"

    assert_text "Qrgenerator was successfully created"
    click_on "Back"
  end

  test "updating a Qrgenerator" do
    visit qrgenerators_url
    click_on "Edit", match: :first

    click_on "Update Qrgenerator"

    assert_text "Qrgenerator was successfully updated"
    click_on "Back"
  end

  test "destroying a Qrgenerator" do
    visit qrgenerators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Qrgenerator was successfully destroyed"
  end
end
