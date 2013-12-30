class WelcomeController < ApplicationController
  def index
    if current_user
      @online_time = 0
    else
      @online_time = Statistic.online_time_for_stranger(request.remote_ip)
    end
  end

  def statistic
    render json: {online_registered_users_count: Statistic.online_registered_user_count, online_strangers_count: Statistic.online_stranger_count}
  end

  def increase_online_time
    if current_user

    else
      Statistic.increase_online_time_for_stranger(request.remote_ip)
    end
    render inline: 'ok'
  end
end
