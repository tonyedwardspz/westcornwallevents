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

  // If localstorage is available
  if(lsTest() === true){
    if (localStorage.getItem("wceUser") !== null){
      fetchUserDetails();
    }
    $("#submission-btn").hover(saveUserDetails);
  }
});

// Retrieve user details from localstorage
function fetchUserDetails() {
  var lsUser = localStorage.getItem('wceUser');
  var user = JSON.parse(lsUser);

  if (isRealValue(user)){
    $('#user_event_first_name').val(user.first);
    $('#user_event_last_name').val(user.last);
    $('#user_event_user_email').val(user.email);
  }
}

// Save user details to localstorage
function saveUserDetails() {
  var user = {
    'first': $('#user_event_first_name').val(),
    'last': $('#user_event_last_name').val(),
    'email': $('#user_event_user_email').val()
  };
  localStorage.setItem('wceUser', JSON.stringify(user));
}

// Check an object for null
function isRealValue(obj){
 return obj && obj !== "null" && obj!== "undefined";
}

function lsTest(){
    var test = 'test';
    try {
        localStorage.setItem(test, test);
        localStorage.removeItem(test);
        return true;
    } catch(e) {
        return false;
    }
}
    
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
