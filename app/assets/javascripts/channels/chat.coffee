App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    console.log("WEBSOCKET CLIENT CONNECTED")
    @perform 'user_connect'

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data['msg'])

  send_msg: (user, text) ->
    @perform 'send_msg', user: user, message: text

  user_connect: ->
    @perform 'user_connect'

  user_disconnect: (data) ->
    @perform 'user_disconnect', username: data
    
    
