class Admin::MemorialsController < ApplicationController
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
      @memorial_pages, @memorials = paginate :memorials, :per_page => 10
    else
      you_are_no_admin
    end      
  end

  def show
    is_admin
    if @is_admin == 1    
      @memorial = Memorial.find(params[:id])
    else
      you_are_no_admin
    end    
  end

  def new
    is_admin
    if @is_admin == 1    
      @memorial = Memorial.new
    else
      you_are_no_admin
    end      
  end

  def create
    is_admin
    if @is_admin == 1    
      @memorial = Memorial.new(params[:memorial])
      if @memorial.save
        flash[:notice] = 'Memorial was successfully created.'
        redirect_to :action => 'list'
      else
        render :action => 'new'
      end
    else
      you_are_no_admin
    end      
  end

  def edit
    is_admin
    if @is_admin == 1    
      @memorial = Memorial.find(params[:id])
    else
      you_are_no_admin
    end      
  end

  def update
    is_admin
    if @is_admin == 1    
      @memorial = Memorial.find(params[:id])
      if @memorial.update_attributes(params[:memorial])
        flash[:notice] = 'Memorial was successfully updated.'
        redirect_to :action => 'show', :id => @memorial
      else
        render :action => 'edit'
      end
    else
      you_are_no_admin
    end      
  end

  def destroy
    is_admin
    if @is_admin == 1    
      Memorial.find(params[:id]).destroy
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
