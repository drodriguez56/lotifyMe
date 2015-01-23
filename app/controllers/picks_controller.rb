 class PicksController < ApplicationController
  
   def new
     @pick = Pick.new
   end

   def create
     @user = User.find_or_create_by(params[:user])
     @pick = Pick.new(params[:pick])
     if @pick.save 
       @user.picks << @pick
       render text: 'good'
     else
       render text: 'faild'
     end
   end

 end
