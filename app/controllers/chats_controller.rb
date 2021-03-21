# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pusher_key = ENV['PUSHER_KEY']
    @user = current_user
    @received_user = User.find(params[:with_user_id])
    @chat = Chat.new(user: @user, received_user: @received_user)
    @chats = Chat.includes(:user).where(user: @user,
                                        received_user: @received_user).or(
                                          Chat.includes(:user).where(user: @received_user,
                                                                     received_user: @user)
                                        ).order(created_at: :asc).last(10)
    @private_channel_name = private_channel_name(@user.id)
    @event_name = event_name(@received_user.id)
  end

  def create
    @user = current_user
    @received_user = User.find(params[:with_user_id])
    @chat = Chat.new(user: @user, received_user: @received_user, message: chat_params[:message])
    if @chat.save!
      data = {
        id: @chat.id,
        message: @chat.message,
        user_name: @chat.user.name,
        user_id: @chat.user.id,
        created_at: @chat.created_at.to_s
      }
      Pusher.trigger_batch(
        [
          { channel: private_channel_name(@user.id), name: event_name(@received_user.id), data: data },
          { channel: private_channel_name(@received_user.id), name: event_name(@user.id), data: data }
        ]
      )
    else
      # なにかエラー処理
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
