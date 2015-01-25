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
        flash[:error] = 'email sent'
        redirect_to root_path
       end
     else
       flash[:error] = 'failed to create entry.. try again'
       redirect_to root_path
     end
   end

   private
   def join_number
    nums_array = []
    (1..6).each do |num|
      number = "number" + num.to_s
      if pick_params[number]
        nums_array << pick_params[number]
      end
    end
    p nums_array.join(" ")
   end

    def pick_params
      params.require(:pick).permit(:number1, :number2, :number3, :number4,:number5, :number6, :game, :draw_date, :multiplier)
    end
 end
