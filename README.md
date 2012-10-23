# Measurable

This gem encompasses various distance measures to be used in different projects. I want to support both the built-in `Array` class and [NMatrix](http://github.com/sciruby/nmatrix)'s `NVector`.

This is a fork of the gem [Distance Measure](https://github.com/reddavis/Distance-Measures), which has a similar objective, but isn't actively maintained and doesn't support NMatrix. Thank you, [reddavis](https://github.com/reddavis). :)

# Distance measures that I want to support for the moment

- Cosine similarity
- Chebyshev distance: http://en.wikipedia.org/wiki/Chebyshev_distance
- Max-min similarity measure (from the paper "K-Means clustering using max-min distance measure")

## Install

`gem install measurable`
  
## How to use

This list will be updated as I have time. I'll refactor the existing measures and add some that I'll need in a project.

The API I intend to support is something like this:

```ruby
require "measurable"
	
u = NVector.ones(2)
v = NVector.zeros(2)
w = [1, 0]

Measurable::euclidean(u, v) # => 1.41421
Measurable::euclidean(w, v) # => 1.00000
Measurable::euclidean(w, w) # => 0.00000
```

Maybe add some support for some of NMatrix's dtypes, like `:float32`, `:float64`, `:complex64`, `:complex128`, etc.

## License

Copyright (c) 2012 Carlos Agarie. See LICENSE for details.

The original `Distance Measure` gem is copyrighted by reddavis 2010.