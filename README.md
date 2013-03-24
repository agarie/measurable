# Measurable

This gem encompasses various distance measures. Besides the `Array` class, I also want to support [NMatrix](http://github.com/sciruby/nmatrix)'s `NVector`.

My objective is to be able to compare different metrics just by changing which method is called. Also, to show how to use NMatrix's C API. I'll create most of the things in pure Ruby first, then the most used operations (or the slowest ones) will be rewritten in C.

This is a fork of the gem [Distance Measure](https://github.com/reddavis/Distance-Measures), which has a similar objective, but isn't actively maintained and doesn't support NMatrix. Thank you, [reddavis](https://github.com/reddavis). :)

## Install

`gem install measurable`

It only works with Ruby MRI 1.9.3 or 2.0.0. I still want to test it on JRuby, but as its still pure Ruby, it should work correctly there.

## Distance measures that I want to support for the moment

- Euclidean distance
- Squared euclidean distance
- Cosine distance
- Max-min distance (["K-Means clustering using max-min distance measure"][1])
- Jaccard distance
- Tanimoto distance

These still need to be implemented:

- Cityblock distance
- Chebyshev distance
- Minkowski distance
- Hamming distance
- Correlation distance
- Chi-square distance
- Kullback-Leibler divergence
- Jensen-Shannon divergence
- Mahalanobis distance
- Squared Mahalanobis distance

## How to use

This list will be updated as I have time. I'll refactor the existing measures and add some that I'll need in a project.

The API I intend to support is something like this:

```ruby
require "measurable"
	
u = NVector.ones(2)
v = NVector.zeros(2)
w = [1, 0]
x = [2, 2]

Measurable::euclidean(u, v) # => 1.41421
Measurable::euclidean(w, v) # => 1.00000
Measurable::euclidean(w, w) # => 0.00000
Measurable::
```

Maybe add support for (some of) NMatrix's dtypes, like `:float32`, `:float64`, `:complex64`, `:complex128`, etc. This will have to way until Measurable supports NMatrix C API.

## License

See LICENSE for details.

The original `Distance Measure` gem is copyrighted by @reddavis.

[1]: http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=05156398