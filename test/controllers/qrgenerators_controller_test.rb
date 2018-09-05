require 'test_helper'

class QrgeneratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qrgenerator = qrgenerators(:one)
  end

  test "should get index" do
    get qrgenerators_url
    assert_response :success
  end

  test "should get new" do
    get new_qrgenerator_url
    assert_response :success
  end

  test "should create qrgenerator" do
    assert_difference('Qrgenerator.count') do
      post qrgenerators_url, params: { qrgenerator: {  } }
    end

    assert_redirected_to qrgenerator_url(Qrgenerator.last)
  end

  test "should show qrgenerator" do
    get qrgenerator_url(@qrgenerator)
    assert_response :success
  end

  test "should get edit" do
    get edit_qrgenerator_url(@qrgenerator)
    assert_response :success
  end

  test "should update qrgenerator" do
    patch qrgenerator_url(@qrgenerator), params: { qrgenerator: {  } }
    assert_redirected_to qrgenerator_url(@qrgenerator)
  end

  test "should destroy qrgenerator" do
    assert_difference('Qrgenerator.count', -1) do
      delete qrgenerator_url(@qrgenerator)
    end

    assert_redirected_to qrgenerators_url
  end
end
