class Admin::TributesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  def upload_picture
  end

  def delete_picture
  end

  def update_picture
  end

  def list
    @tribute_pages, @tributes = paginate :tributes, :per_page => 10
  end

  def show
    @tribute = Tribute.find(params[:id])
  end

  def new
    @tribute = Tribute.new
  end

  def create
    @tribute = Tribute.new(params[:tribute])
    if @tribute.save
      flash[:notice] = 'Tribute was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @tribute = Tribute.find(params[:id])
  end

  def update
    @tribute = Tribute.find(params[:id])
    if @tribute.update_attributes(params[:tribute])
      flash[:notice] = 'Tribute was successfully updated.'
      redirect_to :action => 'show', :id => @tribute
    else
      render :action => 'edit'
    end
  end

  def destroy
    Tribute.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
