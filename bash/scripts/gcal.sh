#!/usr/bin/bash
wget https://www.google.com/calendar/ical/quentin%40quentinboughner.com/private-bbcb3ef407bf6b31cebb169672ae75b2/basic.ics -O /home/kairos/reminders/calendars/default.ics
ical2rem-cli < /home/kairos/reminders/calendars/default.ics > /home/kairos/reminders/gcal-default.rem
