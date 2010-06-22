class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if (@user.save)
      redirect_to :action => "login"
    else
      render :action => "new"
    end
  end

  def view
  end

  def login
  end
  
  def do_login
    username_from_form = params[:username]
    password_from_form = params[:password]
    @user = User.find_by_username(username_from_form)
    if (@user.nil?)
      flash[:notice] = "Unknown User"
      redirect_to :action => "login"
    else
      if (@user.password == password_from_form)
        # User successfully logged in
        session[:user_id] = @user.id
        redirect_to :controller => "tweets", :action => "index"
      else
        flash[:notice] = "Incorrect Password"
        redirect_to :action => "login"
      end
    end
  end
  

  def logout
    session[:user_id] = nil
  end
  


end
