require 'test_helper'

class DischarguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dischargue = dischargues(:one)
  end

  test "should get index" do
    get dischargues_url
    assert_response :success
  end

  test "should get new" do
    get new_dischargue_url
    assert_response :success
  end

  test "should create dischargue" do
    assert_difference('Dischargue.count') do
      post dischargues_url, params: { dischargue: { date: @dischargue.date, liters: @dischargue.liters } }
    end

    assert_redirected_to dischargue_url(Dischargue.last)
  end

  test "should show dischargue" do
    get dischargue_url(@dischargue)
    assert_response :success
  end

  test "should get edit" do
    get edit_dischargue_url(@dischargue)
    assert_response :success
  end

  test "should update dischargue" do
    patch dischargue_url(@dischargue), params: { dischargue: { date: @dischargue.date, liters: @dischargue.liters } }
    assert_redirected_to dischargue_url(@dischargue)
  end

  test "should destroy dischargue" do
    assert_difference('Dischargue.count', -1) do
      delete dischargue_url(@dischargue)
    end

    assert_redirected_to dischargues_url
  end
end
