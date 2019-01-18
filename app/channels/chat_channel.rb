class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_msg(data)
    ActionCable.server.broadcast "room",
                                 user: "<span class='username'>" + data['user'] + " : </span>",
                                 msg: "<span class='message'>" + data['message'] + "</span>"

  end

  def user_connect
    users = ''
    User.where(online: true).each { |item| users = users + "  " + "<button class='users_link' id=#{item[:username]}>#{item[:username]}</button>" }
    ActionCable.server.broadcast "room", users: users
  end

  def user_disconnect (data)
    user = User.find_by(username: data['username'])
    user.update online: false
    user_connect
    ActionCable.server.broadcast "room", users_off: data['username']
  end

end