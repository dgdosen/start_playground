class SessionsController < ApplicationController

  def create
    #puts params[:an_code]
    #puts params[:password]
    user = User.find_by_an_code(params[:an_code])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid."
    end
  end

  def destroy
    puts 'outta here'
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
