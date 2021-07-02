class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_after_authenticate
    else
      flash.now[:alert] = 'Неверный пароль/email'
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def redirect_back_after_authenticate
    redirect_to cookies[:return_to_url] || root_path
    cookies.delete(:return_to_url)
  end
end
