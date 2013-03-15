# 0.1.3

* Moved `mocha/setup` requirement to test helper.
* Unstubbe some stubbed methods making tests sometimes fails.

# 0.1.2

* `Demandbase::lookup()` now returns nil if no record is found.

* Added some new Error classes to
 * raises a `Demandbase::RTIDNotSetError` if a RTID key is not set.
 * raises a `Demandbase::ParseError `if the domain doesn't look legit.
 * raises a `Demandbase::ServerError` if the Demandbase server is unresponsive.


# 0.1.1

* Added support for subdomains, email addresses, etc. e.g. the following now work:

```ruby
  Demandbase::Record.new "www.github.com",
  Demandbase::Record.new "developer.github.com/",
  Demandbase::Record.new "http://www.github.com/",
  Demandbase::Record.new "https://www.github.com",
  Demandbase::Record.new "https://www.github.com/leereilly/demandbase",
  Demandbase::Record.new "lee@github.com"
```

# 0.1.0

* Initial release.