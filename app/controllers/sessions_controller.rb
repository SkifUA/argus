class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  # action for login user and set in session user_id
  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      log_in@user
      if params[:session][:remember_me] == '1'
        remember @user
      end
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  # action logout user delete auth user_id and redirect to root
  def destroy
    log_out
    redirect_to '/'
  end
end
