require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/tributes_controller'

# Re-raise errors caught by the controller.
class Admin::TributesController; def rescue_action(e) raise e end; end

class Admin::TributesControllerTest < Test::Unit::TestCase
  fixtures :tributes

  def setup
    @controller = Admin::TributesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_upload_picture
    get :upload_picture
    assert_response :success
    assert_template 'upload_picture'
  end

  def test_delete_picture
    get :delete_picture
    assert_response :success
    assert_template 'delete_picture'
  end

  def test_update_picture
    get :update_picture
    assert_response :success
    assert_template 'update_picture'
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

    assert_not_nil assigns(:tributes)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:tribute)
    assert assigns(:tribute).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:tribute)
  end

  def test_create
    num_tributes = Tribute.count

    post :create, :tribute => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_tributes + 1, Tribute.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:tribute)
    assert assigns(:tribute).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Tribute.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Tribute.find(1)
    }
  end
end
