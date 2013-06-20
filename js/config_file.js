$(document).ready(function() {
    $(".checklist .checkbox-select").click(
        function(event) {
            event.preventDefault();
            $(this).parent().addClass("selected");
            $(this).parent().find(":checkbox").attr("checked","checked");
        }
    );

    $(".checklist .checkbox-deselect").click(
        function(event) {
            event.preventDefault();
            $(this).parent().removeClass("selected");
            $(this).parent().find(":checkbox").removeAttr("checked");
        }
    );

});
