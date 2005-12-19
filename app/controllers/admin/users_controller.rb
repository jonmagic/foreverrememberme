class Admin::UsersController < ApplicationController
  before_filter :login_required
  layout 'admin'

  def index
    is_admin
    if @is_admin == 1  
      list
      render :action => 'list'
    else
      you_are_no_admin
    end      
  end

  def list
    is_admin
    if @is_admin == 1    
      @user_pages, @users = paginate :users, :per_page => 10
    else
      you_are_no_admin
    end      
  end

  def show
    is_admin
    if @is_admin == 1    
      @user = User.find(params[:id])
    else
      you_are_no_admin
    end    
  end
  
  def destroy
    is_admin
    if @is_admin == 1    
      User.find(params[:id]).destroy
      redirect_to :action => 'list'
    else
      you_are_no_admin
    end    
  end
  
  private
  
  def is_admin
    if !@session[:user].nil?
      if @session[:user].role == 0
        @is_admin = 1
      else
        @is_admin = 0
      end
    end
  end
  
  def you_are_no_admin
    flash[:notice] = "You are not an Admin."
    redirect_to :controller => '/memorial', :action => 'index'
  end
  
end
