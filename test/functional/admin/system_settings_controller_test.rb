require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/system_settings_controller'

# Re-raise errors caught by the controller.
class Admin::SystemSettingsController; def rescue_action(e) raise e end; end

class Admin::SystemSettingsControllerTest < Test::Unit::TestCase
  fixtures :system_settings

  def setup
    @controller = Admin::SystemSettingsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:system_settings)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:system_setting)
    assert assigns(:system_setting).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:system_setting)
  end

  def test_create
    num_system_settings = SystemSetting.count

    post :create, :system_setting => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_system_settings + 1, SystemSetting.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:system_setting)
    assert assigns(:system_setting).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil SystemSetting.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      SystemSetting.find(1)
    }
  end
end
