# Notifilter Gem

[![Build Status](https://travis-ci.org/bittersweet/notifilter-rb.svg)](https://travis-ci.org/bittersweet/notifilter-rb)

This is a early, early version of a gem that sends events to
[Notifilter](https://github.com/bittersweet/notifilter). It is currently UDP
based, so fire and forget.

A TCP version will be forthcoming once everything has ran in production for a
while.

### Ecosystem

[Server](https://github.com/bittersweet/notifilter)

### How to use

```
$notifilter = Notifilter.new("application_name", "127.0.0.1", "8000")
$notifilter.notify("event_identifier", { product_id: 1 })
```

