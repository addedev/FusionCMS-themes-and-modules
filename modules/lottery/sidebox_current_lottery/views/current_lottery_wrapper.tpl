<section id="current-lottery-status" class="sidebox_info">
    <div style="text-align:center;margin-top:10px;margin-bottom:10px;">
        <img src="{$image_path}ajax.gif" />
    </div>
</section>

<script>
    jQuery(function () {
        $.get(Config.URL + "sidebox_current_lottery/status", function (r) {
            $("#current-lottery-status").html(r);
        });
    });
</script>
