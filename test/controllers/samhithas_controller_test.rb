require 'test_helper'

class SamhithasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @samhitha = samhithas(:one)
  end

  test "should get index" do
    get samhithas_url
    assert_response :success
  end

  test "should get new" do
    get new_samhitha_url
    assert_response :success
  end

  test "should create samhitha" do
    assert_difference('Samhitha.count') do
      post samhithas_url, params: { samhitha: {  } }
    end

    assert_redirected_to samhitha_url(Samhitha.last)
  end

  test "should show samhitha" do
    get samhitha_url(@samhitha)
    assert_response :success
  end

  test "should get edit" do
    get edit_samhitha_url(@samhitha)
    assert_response :success
  end

  test "should update samhitha" do
    patch samhitha_url(@samhitha), params: { samhitha: {  } }
    assert_redirected_to samhitha_url(@samhitha)
  end

  test "should destroy samhitha" do
    assert_difference('Samhitha.count', -1) do
      delete samhitha_url(@samhitha)
    end

    assert_redirected_to samhithas_url
  end
end
