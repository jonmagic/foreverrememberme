class Admin::UsersController < ApplicationController
  before_filter :login_required
  before_filter :admin_required
  layout 'admin'

  def index
    search
    render :action => 'search'
  end

  def list
    @user_pages, @users = paginate :users, :per_page => 10
  end

  def show
    @user = User.find(params[:id])
  end
  
  def search
    @users = User.search(params[:q])
  end  

  def destroy
    User.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
