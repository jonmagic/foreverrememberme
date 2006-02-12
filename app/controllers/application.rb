require_dependency "login_system"

class ApplicationController < ActionController::Base
  include LoginSystem
  include SystemSettingsHelper
  model :user

  def admin_required
    if !@session[:user].nil? and @session[:user].role == 0
      return true
    end
    flash[:notice] = "You are not an Admin."
    redirect_to :controller => '/memorial', :action => 'index'
    return false  
  end

end

class StringIO
  def blank?
    self.read.blank?
  end
end