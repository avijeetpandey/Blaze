## Blaze :tada: :rocket:

A networking library made using `Swift` on top of `URLSession`, this allows to quickly setting up network layer in any application and move faster.

## Features
- Ability to make network calls (GET,POST)
- Ability to cancel the network requests
- Ability to set default headers and authorization
- Ability to pass codables and decoded accordingly

## In process
- Advanced logging support
- Adding middlewares
- Adding interceptors


### How to use

```swift

import Blaze

Blaze.initialise(with: <base_url_here>)
Blaze.setDefaultHeader(headers_here)

// to make get call
Blaze.get("/endpoint", completion)
```

This is how to use this module in order to make network request


Made with ❤️ using `Swift`
