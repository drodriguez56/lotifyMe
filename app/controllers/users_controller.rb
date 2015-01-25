class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(email: user_params[:email])
    if @user.update(user_params)
      if @user.created_at.time.min - Time.now.min < 1 || !@user.active
        Notifier.welcome_email(@user).deliver
      end
      @user.active = true; @user.save
      respond_to do |format|
        format.json { render nothing: true, status:200, location: @user}
        format.html {
          redirect_to user_path(@user)
          session[:user_id] = @user.id
        }
      end
    else
      respond_to do |format|
        format.json { render nothing: true, status:400 }
          format.html {
            render :new
            flash[:failure] = "Signup failed."
          }
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      if Time.now.min - @user.created_at.time.min < 1 || !@user.active
        Notifier.welcome_email(@user).deliver
      end
      if !@user.active
        @user.active = true; @user.save
        session[:user_id] = @user.id
      end
      flash[:success] = "Profile updated."
       respond_to do |format|
        format.json { render json: 'this', status:200 }
          format.html {
            redirect_to user_path(@user)
          }
        end
    else
      respond_to do |format|
        format.json { render nothing: true, status:400 }
          format.html {
            render :edit
            flash[:failure] = "Update unsuccessful."
          }
      end
    end
  end

  def show
  end

  def destroy
    session[:user_id] = nil
    @user.active = false; @user.save
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      if params[:user]
         params.require(:user).permit(:username, :email, :phone, :password)
      else
        params.permit(:username, :email, :phone, :password)
      end
    end

end