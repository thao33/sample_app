class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user and !user.activated? and user.authenticated? :activation, params[:id]
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "INvalid activation links"
      redirect_to root_url
    end
  end
end
