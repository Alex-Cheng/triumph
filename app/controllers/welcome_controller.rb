class WelcomeController < ApplicationController
  def index
  end

  def statistic
    render json: {online_registered_users_count: Statistic.online_registered_user_count, online_strangers_count: Statistic.online_stranger_count}
  end
end
