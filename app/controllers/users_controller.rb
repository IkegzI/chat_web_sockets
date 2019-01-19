class UsersController < ApplicationController
  def new
  end

  # CHAT IN
  def create
    user = User.find_by(username: params[:users][:username])  # CHECK FOR REGISTRATION IN BASE
    if user.nil?
      User.create(username: params[:users][:username], online: true)
      cookies.signed[:username] = {value: "#{params[:users][:username]}", expires: 1.hours.from_now}
      session[:id] = cookies.signed[:username]
    elsif user[:online] == false
      user.update online: true                                # CHANGE OF STATUS ON ONLINE
    else                                                      # CHECKING ON A UNIQUENESS NAME
      redirect_to root_path
      return flash.keep[:error] = 'Такой ник в системе уже активен'
    end
    redirect_to chat_path
  end

end
