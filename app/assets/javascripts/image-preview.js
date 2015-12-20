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
      console.log('Error showing added image.');
  };
  reader.readAsDataURL(inputFile);
}
