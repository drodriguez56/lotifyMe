class EmailsController < ApplicationController
  def create
    @email = Email.new(email_params)
    if @email.save
      respond_to do |format|
        format.json { render text: "200"}
        format.html { render text: "200"}
      end
    else
       respond_to do |format|
        format.json { render text: '400'}
        format.html { render text: '400'}
      end
    end
  end

  private

    def email_params
       params.require(:email).permit(:email)
    end

end