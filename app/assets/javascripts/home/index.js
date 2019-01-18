/**
 * Created by keGZ on 16.01.2019.
 */

$(document).ready(function(){
    /* RECEIVE MESSAGE */
    App.chat.received = function(data){
        if (data['msg']!=undefined){
            $("#chat").append(data['msg']+"<br>")
        }
        $("#users").html(data['users'])
    }
    $("#send").click(function(){
        msg = $("#msg").val()
        /* SEND MESSAGE */
        App.chat.send_msg($('#usr').val()+' : ' + msg)
    })
    $("#quit").click(function(){
        App.chat.user_connect()
    })
    $(document).on('click','.users_link',function() {
        $('#msg').val($(this).attr('id')+' : ')
    })
   this.onload(App.chat.user_disconnect($('#usr').attr('id')))
})

