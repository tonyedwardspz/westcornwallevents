$(document).ready( function() {

	// Setup the datepickers
	$('#date_start').datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: 0,
    onSelect: function( selectedDate ) {
        $( "#end_date" ).datepicker( "option", "minDate", selectedDate );
      }
  });
  $('#end_date').datepicker({
    dateFormat: 'dd/mm/yy'
  });

  // Setup the time pickers
  $('.user_event_time').clockpicker({
  	donetext: 'Done',
  	autoclose: true,
    'default': 'now'
  });
});
