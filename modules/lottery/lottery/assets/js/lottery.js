Lottery = {
    subscribe: function () {
        var data = {
            character_guid: $("#character-guid").val(),
            lottery_id: $("#lottery-id").val(),
            account_id: $("#account-id").val(),
            realm_id: $("#character-guid option[value=" + $("#character-guid").val() + "]").data('realm'),
            csrf_token_name: Config.CSRF
        };
        var selected = $("#character-guid option[value=" + data.character_guid + "]").text();

        if (data.character_guid == 0) {
            UI.alert('Please select a character', 1000);
            return;
        }

        UI.confirm("Selected character: " + selected + "<b/>", "Confirm", function () {
            $.post(Config.URL + "lottery/subscribe", data, function (r) {
                if (r == "yes") {
                    $("#subscribe-form").fadeOut(100, function () {
                        $("#current-subscribed-character").html(selected);
                        $("#subscribed-character").fadeIn(100);
                        Lottery.participants();
                    });
                } else {
                    UI.alert(r);
                }
            });
        });

    },
    participants: function () {
        $("#subscribed-characters").fadeOut(100);
        $.get(Config.URL + "lottery/participants/" + $("#lottery-id").val(), function (r) {
            $("#subscribed-characters").html(r).fadeIn(100);
        });
    }
};

jQuery(function () {
    // events
    $("#subscribe-form").submit(function (e) {
        Lottery.subscribe();
        e.preventDefault();
        return false;
    });

    Lottery.participants();
});
