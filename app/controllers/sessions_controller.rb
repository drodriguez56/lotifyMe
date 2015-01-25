class SessionsController < ApplicationController

  def login
  end

  def begin
    user = Session.login_by_username_or_email(params[:user_input])

    if user && user.authenticate(params[:password])
      respond_to do |format|
        format.json { render json: 'logged in ok', status: 200}
        format.html {
          session[:user_id] = user.id
          flash[:success] = "Welcome, #{user.username}!"
          redirect_to root_path
        }
       end
    else
      respond_to do |format|
        format.json { render json: 'login failed', status: 400}
        format.html {
          flash[:failure] = "Login failed."
          render :login
        }
       end
    end
  end

  def end
    session[:user_id] = nil
    redirect_to root_path
  end

end