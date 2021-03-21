# frozen_string_literal: true

class User < ApplicationRecord
  has_many :chats
  has_many :received_chats, class_name: 'Chat', foreign_key: :received_user_id
end
