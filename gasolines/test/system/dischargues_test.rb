require "application_system_test_case"

class DischarguesTest < ApplicationSystemTestCase
  setup do
    @dischargue = dischargues(:one)
  end

  test "visiting the index" do
    visit dischargues_url
    assert_selector "h1", text: "Dischargues"
  end

  test "creating a Dischargue" do
    visit dischargues_url
    click_on "New Dischargue"

    fill_in "Date", with: @dischargue.date
    fill_in "Liters", with: @dischargue.liters
    click_on "Create Dischargue"

    assert_text "Dischargue was successfully created"
    click_on "Back"
  end

  test "updating a Dischargue" do
    visit dischargues_url
    click_on "Edit", match: :first

    fill_in "Date", with: @dischargue.date
    fill_in "Liters", with: @dischargue.liters
    click_on "Update Dischargue"

    assert_text "Dischargue was successfully updated"
    click_on "Back"
  end

  test "destroying a Dischargue" do
    visit dischargues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dischargue was successfully destroyed"
  end
end
