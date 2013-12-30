class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :heart_beat

  private

  def heart_beat
    if current_user
      Statistic.heartbeat_for_registered_user(current_user, request.remote_ip)
    else
      Statistic.heartbeat_for_stranger(request.remote_ip)
    end

    @registered_user_count = Statistic.online_registered_user_count
    @unregistered_user_count = Statistic.online_stranger_count
  end

end
