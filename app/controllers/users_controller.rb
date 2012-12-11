class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end
   def new
  	@user = User.new
  end
  def create
  	@user = User.new(params[:user])
  	if @user.valid? 
  		@user.save
  		sign_in @user
      flash[:success] = "Welcome to James' cool sample apple :)"
  		redirect_to @user
    else
  	  render 'new'
    end
  end
end
