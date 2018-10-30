# README

Alarm clock I made to help my wife and I get up in the morning. See a demo of it [here](http://alarm-clock-rails-demo.herokuapp.com/).

* Requires mplayer, and only for Ubuntu

## TODO

- [x] CRUD alarms
- [x] Application plays music when alarm is set
- [x] CRUD playlists and assign alarms to them
- [x] Add songs to playlists
- [x] Remove songs from playlist
- [x] Snooze/turn off alarms on web page
- [x] Whenever grabs alarms and checks them and plays them
- [ ] Setup heroku to not attach songs, as we don't want to store any data up there
- [ ] Setup heroku to delete everything every ten minutes or so
- [ ] Setup CI and Coveralls support, and include the badges here
- [ ] Write up how to setup for development, what things to add, etc.
- [ ] Fix issue with fresh install, ensuring that all of it moves along swimmingly

## Other things to add

* Add configuration option to determine how to play a song from the DB
	* This makes extending to other operating systems a lot easier
