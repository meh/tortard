tortard - tor for tards
=======================
Just a simple app to map SOCKS address and port to a local address and port that doesn't require
SOCKS.

```ruby
# this will map port 80 of silkroadvb5piz3r.onion to port 9433 on localhost
host 'silkroadvb5piz3r.onion' do
	map 80, 'localhost:9433'
end

# you can achieve the same with
map 'silkroadvb5piz3r.onion:80', 'localhost:9433'
```
