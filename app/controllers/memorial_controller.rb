class MemorialController < ApplicationController
  before_filter :login_required, :except => [ :index, :show, :search, :comment ]
  layout 'memorial'

# Public methods, every one can use them

  def index
  end
  
  def show
    @memorial = Memorial.find(params[:id])
    @memorial.views += 1
    @memorial.save
    is_owner

  end

  def search
    @memorials = Memorial.search(params[:q])
  end
  
  def comment
    Memorial.find(params[:id]).comments.create(params[:comment])
    flash[:notice] = "Added Your Comment."
    redirect_to :action => "show", :id => params[:id]
  end
  
  
# Management methods, all protected by user account

  def manage
    @memorials = Memorial.find_all_by_user_id(@session[:user].id)
  end

  def new
    @memorial = Memorial.new
  end

  def create
    @memorial = Memorial.new(params[:memorial])
    if @memorial.save
      flash[:notice] = 'Memorial was successfully created.'
      redirect_to :action => 'show', :id => @memorial
    else
      render :action => 'new'
    end
  end

  def edit
    @memorial = Memorial.find(params[:id])
    is_owner
    if @owner < 1
      flash[:notice] = 'You are not the owner of this Memorial'
      redirect_to :action => 'show', :id => @memorial
    else
    end
  end

  def update
    @memorial = Memorial.find(params[:id])
    if @memorial.update_attributes(params[:memorial])
      flash[:notice] = 'Memorial was successfully updated.'
      redirect_to :action => 'show', :id => @memorial
    else
      render :action => 'edit'
    end
  end

  def destroy_memorial
    Memorial.find(params[:id]).destroy
    redirect_to :action => 'manage'
  end
  
# My lovely Picture methods, just nice little ones to make pictures do things...
  
  def picture_upload
    Memorial.find(params[:id]).pictures.create(params[:picture])
    flash[:notice] = "Added Your Picture."
    redirect_to :action => "show", :id => params[:id]
  end
  
  def picture_delete
    @memorial = Memorial.find(params[:id])
    Picture.find(params[:picture]).destroy
    redirect_to :action => "show", :id => @memorial
  end
  
  def picture_update
    p = Picture.find(params[:picture])
    p.memorial.image = params[:image]
    p.memorial.save
    redirect_to :action => 'show', :id => p.memorial.id
  end
  
  def picture_delete_confirmation
  end
  
  private
  
  def is_owner
    if !@session[:user].nil?
      if @memorial.user_id == @session[:user].id
        @owner = 1
      else
        @owner = 0
      end
    else
      @owner = 0
    end
  end

end
