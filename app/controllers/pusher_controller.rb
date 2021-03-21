# frozen_string_literal: true

class PusherController < ApplicationController
  before_action :authenticate_user!

  def auth
    if current_user
      response = Pusher.authenticate(private_channel_name(current_user.id), params[:socket_id], {
                                       user_id: current_user.id # => required
                                     })
      render json: response
    else
      render text: 'Forbidden', status: '403'
    end
  end
end
