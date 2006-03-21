require 'ostruct'

class MemorialController < ApplicationController
  before_filter :login_required, :except => [ :index, :features, :faq, :privacypolicy, 
                                              :show, :search, :comment, :extend_return, 
                                              :extend_ipn, :add_tribute, :add_tribute_preview, 
                                              :tribute_ipn, :tribute_payment_return, 
                                              :send_contactus_notification, :contactus ]
                                              
  layout 'application', :except => :show

# Public methods, every one can use them

  def index
    @featured_memorials = Memorial.most_recent
  end
  
  def features
    @featured_memorials = Memorial.most_recent
  end

  def faq
    @featured_memorials = Memorial.most_recent
  end
  
  def privacypolicy
    @featured_memorials = Memorial.most_recent
  end

  def view
  end
  
  def show
    @memorial = Memorial.find(params[:id][/^(\d+)/])    
    is_owner
    if @memorial.expired? 
      if @owner == 1
        flash[:warning] = "This memorial has expired. Only you will be able to view it. Purchase an extension to allow others to view it."
      else
        flash[:warning] = "The requested memorial has expired and cannot be shown."
        redirect_to :action => "index"
      end
    end
    @memorial.increment!('views')    
     render :action => "view", :layout => "showmemorial"
  end

  def search
    if params[:id] == 'query'
      args = { 'firstname'=>params[:search][:firstname], 
               'lastname'=> params[:search][:lastname], 
               'hometown'=> params[:search][:hometown]
              }
      args = args.delete_if {|k, v| v.blank? }
      if args.blank?
        flash[:warning] = "You must enter at least one search term."
        redirect_to :action => "search", :id => nil
        return false
      end
      @search = OpenStruct.new(args.to_hash)
      @memorials = Memorial.search(args)
    end
  end
  
  def comment
    Memorial.find(params[:id]).comments.create(params[:comment])
    flash[:notice] = "Added Your Comment."
    redirect_to :action => "show", :id => params[:id]
  end
  
  def contactus
    @featured_memorials = Memorial.most_recent
    @feedback = Feedback.new
  end
  
  def send_contactus_feedback
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      Notification::deliver_contactus(@feedback)
      flash[:notice] = "Thank you for contacting us."
      redirect_to :action => "index"
    else
      @featured_memorials = Memorial.most_recent      
      render :action => 'contactus'
    end

  end
  

  def add_tribute
    @memorial = Memorial.find(params[:id])
    @tribute_images = TributeImage.find_all
    @tribute = Tribute.new(:image_id => @tribute_images.first.id)
  end

  def add_tribute_preview
    @memorial = Memorial.find(params[:id])
    @tribute = Tribute.new(params[:tribute])
    @memorial.tributes << @tribute
  end


  def tribute_ipn
    notify = Paypal::Notification.new(request.raw_post)
    tribute = Tribute.find(notify.item_id)

    if notify.acknowledge
      begin
        if notify.complete? and preference('tribute_price').to_money == notify.amount
          tribute.activated_at = Time.now
        else
          logger.error("Failed to verify Paypal's notification, please investigate")
        end
      rescue => e
        raise
      ensure
        tribute.save
      end
    end
    render :nothing => true
  end
  
  def tribute_payment_return
    @memorial = Tribute.find(params[:item_number]).memorial
    if params[:payment_status] != 'Completed'
      flash[:notice] = "We're sorry you canceled" if params[:id] == 'canceled'
      redirect_to :action => "add_tribute", :id => @memorial.id
    end
  end
  
  def extend_ipn
    notify = Paypal::Notification.new(request.raw_post)
    memorial = Memorial.find(notify.item_id)

    if notify.acknowledge
      begin
        if notify.complete? and preference('extension_price').to_money == notify.amount
          memorial.expires_at = if memorial.expired?
                                  Time.now + 10.years
                                else
                                  memorial.expires_at + 10.years
                                end
        else
          logger.error("Failed to verify Paypal's notification, please investigate")
        end
      rescue => e
        raise
      ensure
        memorial.save
      end
    end
    render :nothing => true
  end

  def extend_payment_return
    @memorial = Memorial.find(params[:item_number])
    if params[:payment_status] != 'Completed'
      flash[:notice] = "We're sorry you canceled" if params[:id] == 'canceled'
      redirect_to :action => "manage"
    end
  end

# Management methods, all protected by user account

  def manage
    @memorials = Memorial.find_all_by_user_id(@session[:user].id)
  end

  def new
    @memorial = Memorial.new
    @memorial.views = 0
    @memorial.message = "Delete this text and begin typing here."
  end

  def create
    @memorial = Memorial.new(params[:memorial])
    @memorial.user_id = @session[:user].id
    @memorial.views = 0
    @memorial.expires_at = Time.now + 10.days
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
  
  def extend_memorial
    @memorial = Memorial.find(params[:id])
  end
  
  def destroy_memorial
    Memorial.find(params[:id]).destroy
    redirect_to :action => 'manage'
  end
  
# My nice Comment methods, ready to use

  def comment_delete
    @memorial = Memorial.find(params[:id])
    Comment.find(params[:comment]).destroy
    redirect_to :action => "show", :id => @memorial
  end
  
# My lovely Picture methods, just nice little ones to make pictures do things...
  
  def picture_upload
    m = Memorial.find(params[:id])
    if m.pictures.size <= preference('allowed_number_of_photos').to_i
      p = Picture.create(params[:picture])
      if m.primary_picture.nil?
        m.primary_picture = p
      end
      m.pictures << p
      m.save    
      flash[:notice] = "Added Your Picture."
    else
      flash[:warning] = "You cannot exceed #{preference('allowed_number_of_photos')} photos."
    end
    redirect_to :action => "show", :id => params[:id]
  end
  
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
  
  private
  
  def is_owner
    if !@session[:user].nil? and @memorial.user_id == @session[:user].id
      @owner = 1
    else
      @owner = 0
    end
  end

end
