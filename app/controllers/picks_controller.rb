class PicksController < ApplicationController
  before_action :require_login, except: [:create, :index, :destroy]
  before_action :join_number

  def index
    if params[:pick][:email]
        @user = User.find_by(email: params[:pick][:email])
    else
      @user = User.find(session[:user_id])
    end
    if @user
      @picks = User.find(@user.id).picks
      respond_to do |format|
          format.json { render json: ActiveSupport::JSON.encode(@picks), status:200 }
        end
    else
      respond_to do |format|
          format.json { render json: 'user not found', status:400 }
        end
    end
  end
  def create
    @pick = Pick.new(pick_params)
    if params[:pick][:email]
        @user = User.find_by(email: params[:pick][:email])
    else
      @user = User.find(session[:user_id])
    end
    if @pick.save
      user_picks_before_push = @user.picks.count
      @user.picks << @pick
      user_picks_after_push = @user.picks.count
      if user_picks_before_push == user_picks_after_push
        respond_to do |format|
          format.json { render json: 'fail to create pick', status:400 }
          format.html {
            flash[:error] = 'You have already created this Pick Number, please try again.'
              redirect_to user_path(@user)
            }
        end
      else
          respond_to do |format|
            format.json { render json: ActiveSupport::JSON.encode(@pick), status:200 }
            format.html {
              redirect_to user_path(@user)
            }
          end
      end
    else
       respond_to do |format|
          format.json { render json: 'fail to create pick', status:400 }
            format.html {
              flash[:error] = 'Failed to create entry... please try again.'
              redirect_to user_path(@user)
            }
       end
     end
   end

   def destroy
    @pick = Pick.find(params[:id])
    if @pick
      @pick.destroy
      respond_to do |format|
          format.json { render json: 'pick destroyed', status:200 }
          format.html {
            redirect_to user_path(@pick.user)
          }
      end
    else
      respond_to do |format|
          format.json { render json: 'pick not found', status:400 }
      end
    end
   end

   private
   def join_number
    nums_array = []
    if !params[:pick]
      return nil
    else
      (1..6).each do |num|
        number = "number" + num.to_s
        if params[:pick][number]
          nums_array << params[:pick][number]
        end
      end
    end
    if !params[:pick][:number]
      params[:pick][:number] = nums_array.join(" ")
    end
   end

    def pick_params
      params.require(:pick).permit(:number, :game, :draw_date, :multiplier)
    end
 end
