# Google Search

From Rob Pike's [Go Concurrency Patterns][gcp] talk.


## Google Search 2.0

The first example that uses Go channels is [Google Search 2.0][gcp2.0], where we
make queries to the "web", "image", and "video" search services simultaneously,
and merge their results together in whatever order they arrive in:

``` go
func Google(query string) (results []Result) {
    c := make(chan Result)
    go func() { c <- Web(query) } ()
    go func() { c <- Image(query) } ()
    go func() { c <- Video(query) } ()

    for i := 0; i < 3; i++ {
        result := <-c
        results = append(results, result)
    }
    return
}
```

The main issue with this example is that the `c` channel has multiple input and
output goroutines.  The fan-in and fan-out means that we can't use a simple CSP
event to represent each communication.  The naïve approach is to create a single
channel, have the process representing each goroutine communicate on this
channel, and then use `||` to combine them all together:

``` cspm
-- fill this in
```

The issue is that *all* processes that try to communicate on the event in
question must agree to proceed, and then they all do so simultaneously.  This
isn't how a "CSP"-like pipe operates in Go, however.  So we need to create a CSP
gadget that implements the pipe semantics.



[gcp]: https://talks.golang.org/2012/concurrency.slide#42
[gcp2.0]: https://talks.golang.org/2012/concurrency.slide#46
