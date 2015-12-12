$(document).ready( function() {

	// Setup the datepickers
	$('#date_start').datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: 0,
    onSelect: function( selectedDate ) {
        $( "#end_date" ).datepicker( 'option', 'minDate', selectedDate );
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

  $('.user_event_time_end').clockpicker({
    donetext: 'Done',
    autoclose: true,
    'default': 'now'
  });

  $("#user_event_image").change(readURL);
});
    
function readURL(e) {
  console.log("Read URL");
  console.log('change test');

  var $input = $(this);
  var inputFiles = this.files;
  if(inputFiles === undefined || inputFiles.length === 0) return;
  console.log("input files there");
  var inputFile = inputFiles[0];

  var reader = new FileReader();
  reader.onload = function (e) {
      $('#user_image')
        .attr('src', e.target.result);
    };
  reader.onerror = function(event) {
      alert("I AM ERROR: " + event.target.error.code);
  };
  reader.readAsDataURL(inputFile);

}
