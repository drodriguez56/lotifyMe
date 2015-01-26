class PicksController < ApplicationController

  before_action :join_number
   def create
     @user = User.find_by(email: params[:pick][:email])
     if !@user
        @user = User.create(email: params[:pick][:email], password: (0...20).map { ('a'..'z').to_a[rand(26)] }.join)
     end
     @pick = Pick.new(pick_params)
     if @pick.save
       @user.picks << @pick
       if params[:commit]=="signup"
         redirect_to edit_user_path(@user.id), locals: {email: params[:email]}
       else
        if Time.now.min - @user.created_at.time.min < 1
          @pick.send_email
          flash[:notice] = 'email sent'
        end
        respond_to do |format|
          format.json { render json: 'pick created', status:200 }
            format.html {
              redirect_to root_path
            }
        end
       end
     else
       respond_to do |format|
          format.json { render json: 'fail to create pick', status:400 }
            format.html {
              flash[:error] = 'failed to create entry.. try again'
              redirect_to root_path
            }
       end
     end
   end

   def destroy
    @pick = Pick.find(params[:id])
    @pick.destroy
    redirect_to user_path(@pick.user)
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
