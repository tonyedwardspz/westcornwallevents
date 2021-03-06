$(function() {

  $('#side-menu').metisMenu();
  $('#festival_date').datepicker({
    dateFormat: 'dd/mm/yy'
  });
  $('#festival_end_date').datepicker({
    dateFormat: 'dd/mm/yy'
  });
  $('#event_date').datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: 0,
    onSelect: function( selectedDate ) {
        $( "#event_dateend" ).datepicker( 'option', 'minDate', selectedDate );
      }
  });
  $('#event_dateend').datepicker({
    dateFormat: 'dd/mm/yy'
  });

  $('#blog_date_published').datepicker({
    dateFormat: 'dd/mm/yy'
  });

  $('#dataTables-example').DataTable({
    responsive: true,
    order: [[1, 'desc']]
  });

    // Setup the time pickers
  $('.event_time').clockpicker({
    donetext: 'Done',
    autoclose: true,
    'default': 'now'
  });

  $('.event_time_end').clockpicker({
    donetext: 'Done',
    autoclose: true,
    'default': 'now'
  });

  $("#event_image_input").change(readURL);
});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
  $(window).bind("load resize", function() {
    topOffset = 50;
    width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
    if (width < 768) {
      $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
          } else {
            $('div.navbar-collapse').removeClass('collapse');
          }

          height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
          height = height - topOffset;
          if (height < 1) height = 1;
          if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
          }
        });

  var url = window.location;
  var element = $('ul.nav a').filter(function() {
    return this.href == url || url.href.indexOf(this.href) == 0;
  }).addClass('active').parent().parent().addClass('in').parent();
  if (element.is('li')) {
    element.addClass('active');
  }
});
