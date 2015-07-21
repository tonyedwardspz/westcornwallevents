// Festivals
location ~* /festival/penzance_mazey_day_golowan\.(php|html)$ {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /festival/helston_flora_day.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /festival/montol_festival_penzance.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /festival/newlyn_fish_festival.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /festival/st_just_lafrowda_festival.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /festival/firework_displays.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /festival/christmas_lights.php {
	return 301 /festivals/mazey-day-and-golowan-festival;
}


// Venues
location = /venues/minack_theatre.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}


// Pages
location = /about.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}


// Months
location = /events_2014/july.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /events_2014/october.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /events_2014/november.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /events_2014/august.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /events_2014/september.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /events_2015.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /events_2013/june.html {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /events_2011/december.html {
  return 301 /festivals/mazey-day-and-golowan-festival;
}


// Other Snippets
server {
    # redirect all urls to non www
    server_name www.westcornwallevents.com;
    return 301 $scheme://westcornwallevents.com$request_uri;
}
