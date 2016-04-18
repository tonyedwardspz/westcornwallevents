/*global self*/
/*global console*/
/*global document*/
/*global caches*/
/*global fetch*/
var CACHE_NAME = 'sound-unlimited-v1';
var urlsToCache = [
  '/assets/application.css',
  '/assets/application.js'
];

self.addEventListener('install', function(event) {
  'use strict';

	// Open device cache and store our list of items
  event.waitUntil(
    caches.open(CACHE_NAME).then(function(cache) {
      return cache.addAll(urlsToCache);
    })
  );
});

self.addEventListener('fetch', function(event) {
  'use strict';

	// Intercept fetch request
  event.respondWith(
  	// match and serve cached asset if it exists
    caches.match(event.request).then(function(response) {
      if (response) {
        console.log('Cached: ', response);
      }

      return response || fetch(event.request);
    })
  );
});

self.addEventListener('activate', function(event) {
  'use strict';

  event.waitUntil(
  	// Open our apps cache and delete any old cache items
  	caches.open(CACHE_NAME).then(function(cacheNames){
  		cacheNames.keys().then(function(cache){
  			cache.forEach(function(element, index, array) {
  				if (urlsToCache.indexOf(element) === -1){
  					caches.delete(element);
  				}

		    });
  		});
  	})
  );
});
