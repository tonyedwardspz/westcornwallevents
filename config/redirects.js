location ~* "^/events_([0-9]{4})/([a-z]*)\.(php|html?)" {
  return 301 /events?month=$2&year=$1;
}
location ~* "^/events_([0-9]{4})\.(php|html?)" {
  return 301 /events?year=$1;
}
location ~* "^\/festival\/penzance_mazey_day_golowan\.(php|html?)" {
    return 301 /festivals/mazey-day-and-golowan-festival;
}
location ~* "^\/festival\/helston_flora_day\.(php|html?)" {
  return 301 /festivals/helston-flora-day;
}
location ~* "^\/festival\/montol_festival_penzance\.(php|html?)" {
  return 301 /festivals/mazey-day-and-golowan-festival;
}
location ~* "^\/festival\/newlyn_fish_festival\.(php|html?)" {
  return 301 /festivals/newlyn-fish-festival;
}
location ~* "^\/festival\/st_just_lafrowda_festival\.(php|html?)" {
  return 301 /festivals/lafrowda-festival;
}
location = /festival/montol_festival_penzance {
  return 301 /festivals/the-montol-festival;
}
location ~* "^\/festival\/firework_displays\.(php|html?)" {
  return 301 /;
}
location ~* "^\/festival\/christmas_lights\.(php|html?)" {
    return 301 /;
}
location ~* "^\/annual_events_and_festivals\.(php|html?)" {
  return 301 /festivals;
}
location ~* "^\/festival\/festivals\/lafrowda_festival\.(php|html?)" {
  return 301 /festivals/lafrowda-festival;
}
location ^~ /festival/st_ives_september_festival {
  return 301 /festivals/st-ives-september-festival;
}
location ^~ /festival/2011/ {
  return 301 /festivals;
}
location ~* "^\/venues\/minack_theatre\.(php|html?)" {
  return 301 /venues/the-minack-theatre;
}
location ~* "^\/venues\/sound_nightclub_penzance\.(php|html?)" {
  return 301 /venues/sound-nightclub;
}
location ~* "^\/venues\/ritz_penzance\.(php|html?)" {
  return 301 /venues/venues/the-ritz;
}
location ~* "^\/venues\/acorn_arts_centre\.(php|html?)" {
  return 301 /venues/the-acorn-theatre;
}
location ~* "^\/venues\/penlee_open_air_theatre\.(php|html?)" {
  return 301 /venues/penlee-open-air-theatre;
}
location ~* "^\/venues\/trereife_park_house\.(php|html?)" {
  return 301 /venues/trereife-park-and-house;
}
location ~* "^\/venues\/barn_nightclub_penzance\.(php|html?)" {
  return 301 /venues/barn-night-club;
}
location ~* "^\/submit_your_event\.(php|html?)" {
  return 301 /submit_event;
}
location ~* "^\/contact\.(php|html?)" {
  return 301 /submit_event;
}
location ~* "^\/website\/terms_of_use\.(php|html?)" {
  return 301 /pages/legal-information;
}
location ~* "^\/website\/disclaimer\.(php|html?)" {
  return 301 /pages/legal-information;
}
location ~* "^\/website\/legal\.(php|html?)" {
  return 301 /pages/legal-information;
}
location ~* "^\/website\/terms_of_use\.(php|html?)" {
  return 301 /pages/legal-information;
}
location ~* "^\/about\.(php|html?)" {
  return 301 /pages/about;
}
location = /index.html {
  return 301 /;
}
location = /youtube {
  return 301 https://www.youtube.com/user/purelypenzance;
}
location = /facebookpenwithevents {
  return 301 https://www.facebook.com/WestCornwallEvents;
}
location = /west_cornwall_twitter {
  return 301 https://twitter.com/WestCornwall;
}
location ~* "^\/venues\/open_shed_penzance\.(php|html?)" {
  return 301 /venues/open-shed;
}
location ~* "^\/website\/link_exchange\.(php|html?)" {
  return 301 /pages/link-exchange;
}



server {
    # redirect all urls to non www
    server_name www.westcornwallevents.com;
    return 301 $scheme://westcornwallevents.com$request_uri;
}
