<div class="logs-page">
    <section class="box big overlay-filter" id="filter-logs" style="display: none">
        <h2>
            <a class="nice_button leftf js" id="filter-logs-cancel">Close</a>
            Filter logs
            <a id="filter-logs-reset" class="nice_button js rightf"> Reset</a>
        </h2>
            <form id="filter-form">

                <label for="command"><b>Command</b> (or any part of the command)</label>
                <input name="filter[command]" type="text" id="command">

                <label for="player"><b>Gamemaster</b> which executed the command</label>
                <input name="filter[player]" type="text" id="player">

                <label for="selected_player"><b>Selected player</b> the player which was targeted while command was runned</label>
                <input name="filter[selected_player]" type="text" id="selected_player">

                <b>Info:</b>
                To skip a field, leave it blank
                <input type="submit" value="Apply filter">
            </form>
        <span>
        </span>

    </section>

    <section class="box big">

        <h2 class="a-left">
            <a class="nice_button js" data-tip="Filter logs by Gamemaster, Player or Command" id="filter-logs-toggle">Filter</a>
        </h2>
        <div class="logs-page">
            <div class="loader hide" id="logs-loader">
                Parsing logs... Please wait...
            </div>
            <ul id="logs-container" class="logs-list">
            </ul>
        </div>
    </section>
</div>


<script type="text/javascript" src="http://static.wowhead.com/widgets/power.js"></script><script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true, "renamelinks": true }</script>
<script>
    jQuery(function () {
        // load logs via ajax
        function getLogs(filterData) {
            $.ajax({
                url: '{$logsListUrl}',
                data: filterData,
                beforeSend: function () {
                    $("#logs-loader").show();
                    $("#filter-logs").hide();
                    $("#logs-container").html('');
                },
                success: function (r) {
                    $("#logs-loader").hide();
                    $("#logs-container").html(r);
                }
            });
        }
        getLogs();

        // filter bindings and actions
        $("#filter-logs-toggle").click(function () {
            $("#filter-logs").show('fast', function () {
                $("#command").focus();
            });
        });

        $("#filter-logs-cancel").click(function () {
            $("#filter-logs").hide('fast');
        });

        $("#filter-logs-reset").click(function () {
            getLogs();
        });
        $("#filter-form").submit(function (e) {
            e.preventDefault();
            getLogs($(this).serializeArray());
            return false;
        });
    });
</script>
