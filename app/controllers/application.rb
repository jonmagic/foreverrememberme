require_dependency "login_system"

class ApplicationController < ActionController::Base
  include LoginSystem
  include SystemSettingsHelper
  include LinkAndUrlHelper
  model :user

  def admin_required
    if !@session[:user].nil? and @session[:user].role == 'admin'
      return true
    end
    flash[:notice] = "You are not an Admin."
    redirect_to :controller => 'user', :action => 'login'
    return false  
  end

end

class StringIO
  def blank?
    self.read.blank?
  end
end