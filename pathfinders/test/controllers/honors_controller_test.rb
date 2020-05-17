require 'test_helper'

class HonorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @honor = honors(:one)
  end

  test "should get index" do
    get honors_url
    assert_response :success
  end

  test "should get new" do
    get new_honor_url
    assert_response :success
  end

  test "should create honor" do
    assert_difference('Honor.count') do
      post honors_url, params: { honor: { category_id: @honor.category_id, image_url: @honor.image_url, name: @honor.name, requirements: @honor.requirements } }
    end

    assert_redirected_to honor_url(Honor.last)
  end

  test "should show honor" do
    get honor_url(@honor)
    assert_response :success
  end

  test "should get edit" do
    get edit_honor_url(@honor)
    assert_response :success
  end

  test "should update honor" do
    patch honor_url(@honor), params: { honor: { category_id: @honor.category_id, image_url: @honor.image_url, name: @honor.name, requirements: @honor.requirements } }
    assert_redirected_to honor_url(@honor)
  end

  test "should destroy honor" do
    assert_difference('Honor.count', -1) do
      delete honor_url(@honor)
    end

    assert_redirected_to honors_url
  end
end
