



var googleAdvertsInit = function(){
	console.log("Ads by google");

	// Store advert string
	var responsiveAd = '<ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-7067632003386523" data-ad-slot="3266367277" data-ad-format="auto"></ins>';

	// get refrence to the adverts containers
	var bodyContainer = $(".google-ad-body");
	// insert the add into div
	$(bodyContainer).append(responsiveAd);


	// fire off googles own insert method
	(adsbygoogle = window.adsbygoogle || []).push({});
}



