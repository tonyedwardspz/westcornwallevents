// Festivals
location = /festival/penzance_mazey_day_golowan.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /festival/helston_flora_day.php {
  return 301 /festivals/helston-flora-day;
}
location = /festival/montol_festival_penzance.php {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location = /festival/newlyn_fish_festival.php {
  return 301 /festivals/newlyn-fish-festival;
}
location = /festival/st_just_lafrowda_festival.php {
  return 301 festivals/lafrowda-festival;
}
location = /festival/firework_displays.php {
  return 301 /;
}
location = /festival/christmas_lights.php {
	return 301 /;
}
location = /venues/minack_theatre.php {
  return 301 /venues/the-minack-theatre;
}
location = /about.php {
  return 301 /;
}
// Other Snippets
server {
    # redirect all urls to non www
    server_name www.westcornwallevents.com;
    return 301 $scheme://westcornwallevents.com$request_uri;
}












































location = /events_2011/december.html {
  return 301 /events?month=December&year=2011;
}






















