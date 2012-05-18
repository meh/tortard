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

# if you want you can use SSL
ssl :internal do
  # maps here will use SSL internally, which means you will be able to connect
  # to the local port without SSL
end

ssl :external do
  # this will require SSL to connect but won't use it internally
end

ssl :both do
  # this will use SSL on both ends
end
```
