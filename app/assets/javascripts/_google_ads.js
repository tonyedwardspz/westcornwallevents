
var googleAdvertsInit = function(){
	// Store advert string
	var responsiveAd = '<ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-7067632003386523" data-ad-slot="3266367277" data-ad-format="auto"></ins>';
  var sideAdvert = '<ins class="adsbygoogle" style="display:inline-block;width:160px;height:600px" data-ad-client="ca-pub-7067632003386523" data-ad-slot="7576871213"></ins>';

	// get refrence to the adverts containers and insert the add into div
	$(".google-ad-body").append(responsiveAd);

	if (window.innerWidth > 650 && $(document).height() > 1500){
      $('#sideSlot').append(sideAdvert)
  }

	// fire off googles own insert method
	(adsbygoogle = window.adsbygoogle || []).push({});
}
