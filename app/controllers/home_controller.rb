class HomeController < ApplicationController
  def index
    user = User.find_by(username: cookies.signed[:username])
    if user.online == false
      redirect_to root_path
      return flash.keep[:error] = 'Ваша сессия завершена'
    end
  end
end
