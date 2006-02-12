class Admin::SystemSettingsController < ApplicationController
  before_filter :login_required
  before_filter :admin_required
  layout 'admin'

  def index
    list
    render :action => 'list'
  end

  def list
    @system_setting_pages, @system_settings = paginate :system_settings, :per_page => 10
  end

  def show
    @system_setting = SystemSetting.find(params[:id])
  end

  def new
    @system_setting = SystemSetting.new
  end

  def create
    @system_setting = SystemSetting.new(params[:system_setting])
    if @system_setting.save
      flash[:notice] = 'SystemSetting was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @system_setting = SystemSetting.find(params[:id])
  end

  def update
    @system_setting = SystemSetting.find(params[:id])
    if @system_setting.update_attributes(params[:system_setting])
      flash[:notice] = 'SystemSetting was successfully updated.'
      redirect_to :action => 'show', :id => @system_setting
    else
      render :action => 'edit'
    end
  end

  def destroy
    SystemSetting.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
