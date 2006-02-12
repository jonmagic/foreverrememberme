class Admin::MemorialsController < ApplicationController
  before_filter :login_required
  before_filter :admin_required
  layout 'admin'
  
  def index
    search
    render :action => 'search'
  end

  def list
    @memorial_pages, @memorials = paginate :memorials, :per_page => 20
  end

  def show
    @memorial = Memorial.find(params[:id])
  end
  
  def search
      @memorials = Memorial.admin_memorial_search(params[:q])
  end

  def change_expiration
    @memorial = Memorial.find(params[:id])
  end
  
  def update_expiry
    @memorial = Memorial.find(params[:id])
    if @memorial.update_attributes(params[:memorial])
      flash[:notice] = 'Expiration was successfully updated.'
      redirect_to :action => 'show', :id => @memorial
    else
      render :action => 'list'
    end
  end
  
  def edit
    @memorial = Memorial.find(params[:id])
  end

  def update
    @memorial = Memorial.find(params[:id])
    if @memorial.update_attributes(params[:memorial])
      flash[:notice] = 'Memorial was successfully updated.'
      redirect_to :action => 'show', :id => @memorial
    else
      render :action => 'show'
    end
  end

  def destroy
    Memorial.find(params[:id]).destroy
    flash[:notice] = 'Memorial and all associated objects were destroyed'
    redirect_to :action => 'list'
  end
  
  # My nice Comment methods, ready to use

  def comment_delete
    @memorial = Memorial.find(params[:id])
    Comment.find(params[:comment]).destroy
    redirect_to :action => "show", :id => @memorial
  end

  # My lovely Picture methods, just nice little ones to make pictures do things...

  def picture_delete
    @memorial = Memorial.find(params[:id])
    p = Picture.find(params[:picture])
    p.destroy
    redirect_to :action => "show", :id => @memorial
  end
  
  def set_primary_picture
    m = Memorial.find(params[:id])
    p = Picture.find(params[:picture])
    m.primary_picture = p
    m.save
    redirect_to :action => 'show', :id => p.memorial.id
  end
  
end
