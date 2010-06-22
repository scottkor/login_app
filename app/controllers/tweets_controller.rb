class TweetsController < ApplicationController
   def new
    @tweet = Tweet.new
  end
  
    before_filter :get_logged_in_user, :only => [:new, :post]

  def post
    @tweet = Tweet.new(params[:tweet])
    @tweet.posted = Time.now
	@tweet.user = @user
    if @tweet.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  def user
    @user = User.find(params[:id])
  end

  def index
    @page = params[:page]
    if @page.nil?
      @page = 1
    end
    @page = @page.to_i
    @tweet_list = Tweet.find(:all, :order => "posted DESC", :limit => 10, :offset => (@page-1) * 10)
  end
  
  def get_logged_in_user
    id = session[:user_id]
    if (id == nil)
      flash[:notice] = "You must log in first"
      redirect_to :controller => "user", :action => "login"
    else
      @user = User.find(id)
    end
  end

end

