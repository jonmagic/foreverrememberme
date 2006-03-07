class Admin::TributesController < ApplicationController
  before_filter :login_required
  before_filter :admin_required
  layout 'admin'
  
  def index
    list
    render :action => 'list'
  end

  def list
    @tribute_pages, @tributes = paginate :tribute_images, :per_page => 10
  end

  def show
    @tribute = TributeImage.find(params[:id])
    @picture = @tribute.picture
  end

  def new
    @tribute = TributeImage.new
    @tribute.description = "Delete this text and begin typing here."    
  end
  
  def picture
    @tribute = TributeImage.find(params[:id])
  end

  def create
    @tribute = TributeImage.new(params[:tribute])
    @tribute.picture = TributeImage.create(params[:picture])
    if @tribute.save
      flash[:notice] = 'Tribute was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @tribute = TributeImage.find(params[:id])
  end

  def update
    @tribute = TributeImage.find(params[:id])
    @tribute.title = (params[:tribute][:title])
    @tribute.description = (params[:tribute][:description])
    unless params[:picture]["image"].blank?
       @tribute.picture = Picture.create(params[:picture])
    end
    if @tribute.save
      flash[:notice] = 'Tribute was successfully updated.'
      redirect_to :action => 'show', :id => @tribute
    else
      render :action => 'edit'
    end
  end

  def destroy
    TributeImage.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
