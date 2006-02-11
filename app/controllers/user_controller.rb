class UserController < ApplicationController
  layout  'memorial'

  def login
    case @request.method
      when :post
      if @session[:user] = User.authenticate(@params[:user_login], @params[:user_password])

        flash['notice']  = "Login successful"
        redirect_back_or_default :controller => "memorial", :action => "manage"
      else
        flash.now['notice']  = "Login unsuccessful"

        @login = @params[:user_login]
      end
    end
  end
  
  def test_back
  end
  
  def signup
    @user = User.new(@params[:user])

    if @request.post? and @user.save
      @session[:user] = User.authenticate(@user.login, @params[:user][:password])
      flash['notice']  = "Signup successful"
      redirect_back_or_default :controller => "memorial", :action => "manage"
    end      
  end  
  
  def logout
    @session[:user] = nil
    redirect_back_or_default :controller => "memorial", :action => "index"    
  end
    
  def welcome
  end
  
end
