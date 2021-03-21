# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find(user_params[:id])
    session[:login_user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:login_user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end
end
