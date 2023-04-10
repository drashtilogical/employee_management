class HomeController < ApplicationController
  def index
  end
  def tables
    @users = User.all
  end
end
