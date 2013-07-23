# Measurable

This gem is meant to be used for research in machine learning algorithms, to test what metric is best for certain kinds of datasets. My objective is to be able to compare different metrics just by changing which method is called.

Besides the `Array` class, I also want to support [NMatrix](http://github.com/sciruby/nmatrix)'s `NVector`.

The distance measures will be created in Ruby first. If I see that it's really too slow, I'll write some methods in C (or Java, for JRuby).

This is a fork of the gem [Distance Measure](https://github.com/reddavis/Distance-Measures), which has a similar objective, but isn't actively maintained and doesn't support NMatrix. Thank you, [@reddavis][reddavis]. :)

## Install

`gem install measurable`

I only tested it with 2.0.0 (yes, yes, travis, I'll do it eventually). I want to support JRuby as well.

## Distance measures that I want to support for the moment

- Euclidean distance
- Squared euclidean distance
- Cosine distance
- Max-min distance (["K-Means clustering using max-min distance measure"][maxmin])
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

The API I intend to support is something like this:

```ruby
require "measurable"

u = NVector.ones(2)
v = NVector.zeros(2)
w = [1, 0]
x = [2, 2]

# Calculate the distance between two points in space.
Measurable.euclidean(u, v) # => 1.41421
Measurable.euclidean(w, v) # => 1.00000
Measurable.cosine([1, 2], [2, 3]) # => 0.00772

# Calculate the norm of a vector, i.e. its distance from the origin.
Measurable.euclidean_squared([3, 4]) # => 25
```

Maybe add support for (some of) NMatrix's dtypes, like `:float32`, `:float64`, `:complex64`, `:complex128`, etc. This will have to wait until Measurable supports NMatrix's API.

## License

See LICENSE for details.

The original `distance_measures` gem is copyrighted by [@reddavis][reddavis].

[maxmin]: http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=05156398

[reddavis]: (https://github.com/reddavis)