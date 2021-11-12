class HomeController < ApplicationController
#before_action :authenticate_admin!
  def index
  end
  def about
    @about_me="My Name Is Deepak"

  end
end
