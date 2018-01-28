require 'test_helper'

class CaesarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caesar = caesars(:one)
  end

  test "should get index" do
    get caesars_url
    assert_response :success
  end

  test "should get new" do
    get new_caesar_url
    assert_response :success
  end

  test "should create caesar" do
    assert_difference('Caesar.count') do
      post caesars_url, params: { caesar: {  } }
    end

    assert_redirected_to caesar_url(Caesar.last)
  end

  test "should show caesar" do
    get caesar_url(@caesar)
    assert_response :success
  end

  test "should get edit" do
    get edit_caesar_url(@caesar)
    assert_response :success
  end

  test "should update caesar" do
    patch caesar_url(@caesar), params: { caesar: {  } }
    assert_redirected_to caesar_url(@caesar)
  end

  test "should destroy caesar" do
    assert_difference('Caesar.count', -1) do
      delete caesar_url(@caesar)
    end

    assert_redirected_to caesars_url
  end
end
