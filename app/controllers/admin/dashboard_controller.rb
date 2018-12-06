class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["AUTHENTICATE_NAME"], password: ENV["AUTHENTICATE_PASSWORD"]


  def show
  end
end
