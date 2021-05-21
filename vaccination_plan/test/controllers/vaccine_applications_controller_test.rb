require "test_helper"

class VaccineApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vaccine_application = vaccine_applications(:one)
  end

  test "should get index" do
    get vaccine_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_vaccine_application_url
    assert_response :success
  end

  test "should create vaccine_application" do
    assert_difference('VaccineApplication.count') do
      post vaccine_applications_url, params: { vaccine_application: { child_id: @vaccine_application.child_id, date: @vaccine_application.date, dosis: @vaccine_application.dosis, nurse_id: @vaccine_application.nurse_id, vaccine_id: @vaccine_application.vaccine_id } }
    end

    assert_redirected_to vaccine_application_url(VaccineApplication.last)
  end

  test "should show vaccine_application" do
    get vaccine_application_url(@vaccine_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_vaccine_application_url(@vaccine_application)
    assert_response :success
  end

  test "should update vaccine_application" do
    patch vaccine_application_url(@vaccine_application), params: { vaccine_application: { child_id: @vaccine_application.child_id, date: @vaccine_application.date, dosis: @vaccine_application.dosis, nurse_id: @vaccine_application.nurse_id, vaccine_id: @vaccine_application.vaccine_id } }
    assert_redirected_to vaccine_application_url(@vaccine_application)
  end

  test "should destroy vaccine_application" do
    assert_difference('VaccineApplication.count', -1) do
      delete vaccine_application_url(@vaccine_application)
    end

    assert_redirected_to vaccine_applications_url
  end
end
