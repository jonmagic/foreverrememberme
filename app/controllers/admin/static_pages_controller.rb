class Admin::StaticPagesController < ApplicationController
  before_filter :login_required
  before_filter :admin_required
  layout 'admin'

  def index
    list
    render :action => 'list'
  end

  def list
    @static_page_pages, @static_pages = paginate :static_pages, :per_page => 10
  end

  def show
    @static_page = StaticPage.find(params[:id])
  end

  def new
    @static_page = StaticPage.new
    @static_page.value = "Delete this text and begin typing here."    
  end

  def create
    @static_page = StaticPage.new(params[:static_page])
    if @static_page.save
      flash[:notice] = 'StaticPage was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @static_page = StaticPage.find(params[:id])
  end

  def update
    @static_page = StaticPage.find(params[:id])
    if @static_page.update_attributes(params[:static_page])
      flash[:notice] = 'StaticPage was successfully updated.'
      redirect_to :action => 'show', :id => @static_page
    else
      render :action => 'edit'
    end
  end

  def destroy
    StaticPage.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
