$(document).ready(function () {
    /* RECEIVE MESSAGE */
    App.chat.received = function (data) {
        if (data['msg'] != undefined) {
            $("#chat").append(data['user'] + data['msg'] + '<br>')
        }
        /* CHECK ONLINE */
        if ($("#usr").text() == data['users_off']) {
            window.location.href = '/'
        }
        $(".users").html(data['users'])
    }

    /* SEND MESSAGE */
    $("#send").click(function () {
        App.chat.send_msg($('#usr').text(), $("#msg").val())
    })

    /* EXIT */
    $("#quit").click(function usr_out() {
        App.chat.user_disconnect($('#usr').text())
        //
    })

    /* ANSWER */
    $(document).on('click', '.users_link', function () {
        $('#msg').val($(this).attr('id') + ' : ')
    })
    window.onbeforeunload = function () {
        if ($('div').is('#chat') == true) {
            App.chat.user_disconnect($('#usr').text())
        }
    }
})
