require "application_system_test_case"

class VaccineApplicationsTest < ApplicationSystemTestCase
  setup do
    @vaccine_application = vaccine_applications(:one)
  end

  test "visiting the index" do
    visit vaccine_applications_url
    assert_selector "h1", text: "Vaccine Applications"
  end

  test "creating a Vaccine application" do
    visit vaccine_applications_url
    click_on "New Vaccine Application"

    fill_in "Child", with: @vaccine_application.child_id
    fill_in "Date", with: @vaccine_application.date
    fill_in "Dosis", with: @vaccine_application.dosis
    fill_in "Nurse", with: @vaccine_application.nurse_id
    fill_in "Vaccine", with: @vaccine_application.vaccine_id
    click_on "Create Vaccine application"

    assert_text "Vaccine application was successfully created"
    click_on "Back"
  end

  test "updating a Vaccine application" do
    visit vaccine_applications_url
    click_on "Edit", match: :first

    fill_in "Child", with: @vaccine_application.child_id
    fill_in "Date", with: @vaccine_application.date
    fill_in "Dosis", with: @vaccine_application.dosis
    fill_in "Nurse", with: @vaccine_application.nurse_id
    fill_in "Vaccine", with: @vaccine_application.vaccine_id
    click_on "Update Vaccine application"

    assert_text "Vaccine application was successfully updated"
    click_on "Back"
  end

  test "destroying a Vaccine application" do
    visit vaccine_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vaccine application was successfully destroyed"
  end
end
