class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # after create, user's status is logged in, then create session to store user_ids
      log_in @user
      flash[:success] = "Welcom to the Sample App!"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end
end
