require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
    assert_select 'title', 'Home | Informer'
  end

  test 'should get about' do
    get about_path
    assert_response :success
    assert_select 'title', 'About | Informer'
  end

  test 'should get contact' do
    get contact_path
    assert_response :success
    assert_select 'title', 'Contact | Informer'
  end

  test 'should get complete' do
    get complete_path
    assert_response :success
  end
end
