class SessionsController < ApplicationController

  def login
  end

  def begin
    user = Session.login_by_username_or_email(params[:user_input])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to root_path
    else
      flash[:failure] = "Login failed."
      render :login
    end
  end

  def end
    session[:user_id] = nil
    redirect_to root_path
  end

end