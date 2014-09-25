#!/usr/bin/env ruby

require "csv"

stops = CSV.read("gtfs/stops.txt").map! { |s| [s[0], s[2]]}
header = stops.shift
stops
  .reject! { |s| /Station/.match(s.last) }
  .map! { |s| s.last.gsub!(/ Caltrain/, ''); s }
stops.unshift(header)
CSV.open("stops.csv", "wb") { |c| stops.each { |i| c << i } }

times = CSV.read("gtfs/stop_times.txt").map! { |s| s[0..4]}
header = times.shift
times
  .select! { |s| /14OCT/.match(s[0]) }
  .map! { |s| id = s[0].split('-'); s[0] = [id[0], id[4]].join('-'); s }
times.unshift(header)
CSV.open("times.csv", "wb") { |c| times.each { |i| c << i } }

`curl -X POST -s --data-urlencode 'input@fastclick.js' http://javascript-minifier.com/raw > fastclick.min.js`
`curl -X POST -s --data-urlencode 'input@jquery.cookie.js' http://javascript-minifier.com/raw > jquery.cookie.min.js`
`curl -X POST -s --data-urlencode 'input@default.js' http://javascript-minifier.com/raw > default.min.js`
`curl -X POST -s --data-urlencode 'input@default.css' http://cssminifier.com/raw > default.min.css`
