# frozen_string_literal: true

class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :received_user, class_name: 'User', foreign_key: :received_user_id
end
