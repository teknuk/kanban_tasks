$(function() {
    $( "#notStarted, #doing, #accepted" ).sortable({
        connectWith: ".connectedSortable",
        receive: function( event, ui ) {
            var sortedItemId = ui.item.attr('id');
            var newListStatus = this.id;
            updateStatus(sortedItemId, newListStatus);

           // $("#foo").append("<div class='col-md-4'><div class='well'><p>Sorted Item ID: " + sortedItemId + "</p>\
      	//<p>Sorted Item Text: " + sortedItemText + "</p>\
      	//<p>[" + this.id + "] received [" + ui.sender.attr("id") + '-' + ui.item.attr('id') + "]\
    	 	//from [" + ui.sender.attr("id") + "]</p>\
    	 	//</p></div></div>"
           // );
        },
        stop: function( event, ui ) { console.log('Stop!'); }
    }).disableSelection();

    updateStatus = function (task_id, new_status)
    {
        var array = [task_id,new_status];
        $.ajax({
            url : "/tasks/update_status/",
            type : "patch",
            data: {data_value: JSON.stringify(array)}
        });
    };
});