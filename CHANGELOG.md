# 0.1.1

* Add support for subdomains, email addresses, etc. e.g. the following now work:

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