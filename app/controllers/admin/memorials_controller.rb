class Admin::MemorialsController < ApplicationController
  layout 'memorial'
  
  def index
    list
    render :action => 'list'
  end

  def list
    @memorial_pages, @memorials = paginate :memorials, :per_page => 10
  end

  def show
    @memorial = Memorial.find(params[:id])
  end

  def new
    @memorial = Memorial.new
  end

  def create
    @memorial = Memorial.new(params[:memorial])
    if @memorial.save
      flash[:notice] = 'Memorial was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
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
      render :action => 'edit'
    end
  end

  def destroy
    Memorial.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
