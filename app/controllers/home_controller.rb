# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @received_users = User.where.not(id: @user.id)
  end
end
