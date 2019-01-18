$(document).ready(function () {
    /* RECEIVE MESSAGE */
    App.chat.received = function (data) {
        if (data['msg'] != undefined) {
            $("#chat").append(data['user'] + data['msg'] + '<br>')
        }
        if ($("#usr").text() == data['users_off']) {
        window.location.href = '/'
        }
        $(".users").html(data['users'])
    }

    $("#send").click(function () {
        /* SEND MESSAGE */
        App.chat.send_msg($('#usr').text(), $("#msg").val())
    })

    $("#quit").click(function usr_out() {
        App.chat.user_disconnect($('#usr').text())
        // 
    })

    $(document).on('click', '.users_link', function () {
        $('#msg').val("<span class='answer'>" + $(this).attr('id') + ' : ' + "</span>")
    })
})


/**
 * Created by keGZ on 16.01.2019.
 */

