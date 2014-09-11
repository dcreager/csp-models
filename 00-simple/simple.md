# Simple examples


## Printing the Fibonacci numbers

From Andrew Gerrand's [Sydney 2012 talk][gerrand02] talk:

``` go
package main

import "fmt"

func main() {
    ch := make(chan int)
    go fibs(ch)
    for i := 0; i < 20; i++ {
        fmt.Println(<-ch)
    }
}

func fibs(ch chan int) {
    i, j := 0, 1
    for {
        ch <- j
        i, j = j, i+j
    }
}
```


[gerrand02]: http://talks.golang.org/2012/chat.slide#19
