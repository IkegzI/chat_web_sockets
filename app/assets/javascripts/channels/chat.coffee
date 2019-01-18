App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    console.log("WEBSOCKET CLIENT CONNECTED")
    @perform 'user_connect'

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data['msg'])

  send_msg: (data) ->
    @perform 'send_msg', message: data

  user_connect: ->
    @perform 'user_connect'
    
