class Statistic
  @@online_strangers = {}
  @@online_time = {} # Time unit is Second.

  def Statistic.increase_online_time_for_stranger(ip)
    time = (@@online_time[ip] or 0)
    time += 1
    @@online_time[ip] = time
  end

  def Statistic.online_time_for_stranger(ip)
    ((@@online_time[ip] or 0) * 1.0 / 60).ceil
  end

  def Statistic.heartbeat_for_stranger(ip)
    @@online_strangers[ip] = Time.now
    if @@online_strangers.size > 1000
      @@online_strangers = @@online_strangers.select {|k, v| v > 20.minutes.ago}
    end
  end

  def Statistic.heartbeat_for_registered_user(user, ip)
    @@online_strangers.delete(ip)
    user.try :touch
  end

  def Statistic.online_registered_user_count
    User.all.select {|user| user.updated_at > 20.minutes.ago }.size
  end

  def Statistic.online_stranger_count
    @@online_strangers = @@online_strangers.select {|k, v| v!= nil && v > 20.minutes.ago}
    @@online_strangers.size
  end
end