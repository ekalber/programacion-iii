require "application_system_test_case"

class HonorsTest < ApplicationSystemTestCase
  setup do
    @honor = honors(:one)
  end

  test "visiting the index" do
    visit honors_url
    assert_selector "h1", text: "Honors"
  end

  test "creating a Honor" do
    visit honors_url
    click_on "New Honor"

    fill_in "Category", with: @honor.category_id
    fill_in "Image url", with: @honor.image_url
    fill_in "Name", with: @honor.name
    fill_in "Requirements", with: @honor.requirements
    click_on "Create Honor"

    assert_text "Honor was successfully created"
    click_on "Back"
  end

  test "updating a Honor" do
    visit honors_url
    click_on "Edit", match: :first

    fill_in "Category", with: @honor.category_id
    fill_in "Image url", with: @honor.image_url
    fill_in "Name", with: @honor.name
    fill_in "Requirements", with: @honor.requirements
    click_on "Update Honor"

    assert_text "Honor was successfully updated"
    click_on "Back"
  end

  test "destroying a Honor" do
    visit honors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Honor was successfully destroyed"
  end
end
