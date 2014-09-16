var Lottery = {
    send: function (id) {
        var data = {
            days: $("#days").val(),
            rewards: $("#rewards").val(),
            extra_rewards: $("#extra-rewards").val(),
            description: $("#description").val(),
            post_article: $("#post_article").is(':checked'),
            winners_count: $("#winners-count").val(),
            vp: $("#vp").val(),
            dp: $("#dp").val(),
            csrf_token_name: Config.CSRF
        };
        $.post(Config.URL + "lottery/admin/create" + ((id) ? "/" + id : ""), data, function (r) {
            if (r == "yes") {
                window.location = Config.URL + "lottery/admin";
            } else {
                UI.alert(r);
            }
        });
    },
    create: function (show) {
        if (show) {
            $("#lottery-list").fadeOut(100, function () {
                $("#create-lottery").fadeIn(100);
            });
        } else {
            $("#create-lottery").fadeOut(100, function () {
                $("#lottery-list").fadeIn(100);
            });
        }
    },
    delete: function (id) {
        $.get(Config.URL + "lottery/admin/delete/" + id, function (r) {
            UI.alert(r);
            $("#lottery-id-" + id).hide(200);
        });
    }
};

jQuery(function () {
    // events binds
    $("#toggle-create").click(function () {
        Lottery.create(true);
    });

    $("#toggle-list").click(function () {
        Lottery.create(false);
    });

    $("#create-lottery-form").submit(function (e) {
        UI.confirm("Are you sure you want to start a new lottery session?", "Yes", function () {
            Lottery.send();
        });
        e.preventDefault();
        return false;
    });

    $("#lottery-list [rel~=delete]").each(function () {
        var $a = $(this);
        $a.click(function () {
            UI.confirm("Are you sure?", "Delete", function () {
                Lottery.delete($a.data('id'));
            });
        });
    });
});
