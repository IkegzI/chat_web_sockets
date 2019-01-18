class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

  end

  def send_msg(data)
  	ActionCable.server.broadcast "room", msg: data['message']

  end

  def user_connect
    users = ''
    User.where(online: true).each{|item|  users = users + "  " + "<button class='users_link' id=#{item[:username]}>#{item[:username]}</button>"}
    ActionCable.server.broadcast "room", users: users
  end

end