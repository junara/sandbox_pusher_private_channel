# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def private_channel_name(user_id)
    "private-channel_user_id_#{user_id}"
  end

  def event_name(user_id)
    "new_post_with_user_id_#{user_id}"
  end

  def current_user
    return unless session[:login_user_id]

    User.find(session[:login_user_id])
  end

  def authenticate_user!
    return if current_user.present?

    redirect_to sign_in_path
  end
end
