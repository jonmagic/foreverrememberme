class Admin::UsersController < ApplicationController
  before_filter :login_required
  before_filter :admin_required
  layout 'admin'

  def index
    list
    render :action => 'list'
  end

  def list
    @user_pages, @users = paginate :users, :order => 'lastname ASC', :per_page => 20
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
