class WelcomeController < ApplicationController
  before_filter :init_statistic

  def index
  end

  private
  def init_statistic
    @registered_user_count = 100
    @unregistered_user_count = 50
  end
end
