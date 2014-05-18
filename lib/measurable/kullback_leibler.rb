module Measurable
  module KullbackLeibler

    # call-seq:
    #     kullback_leibler(p, q) -> Float
    #
    # The Kullback-Leibler Divergence between the distributions +p+ and +q+ is
    # a measure of their dissimilarity. However, it doesn't obey the triangular
    # inequality and isn't symmetric, thus it isn't a metric.
    #
    # It is calculated as follows:
    #
    #   KL(p, q) = \sum_{i = q}^{N} p[i] * log(p[i] / q[i])
    #
    # With distributions +p+ and +q+ represented as vectors of N elements
    # summing to 1.0.
    #
    # References:
    # - http://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence
    # - Christopher D. Manning and Hinrich Schütze. Foundations of Statistical
    #   Natural Language Processing.
    #
    # * *Arguments*:
    #   - +p+ -> A probability distribution represented by a n-element Array.
    #   - +q+ -> A probability distribution represented by a n-element Array.
    # * *Returns*:
    #   A measure of the difference between the probability distributions p and q.
    def kullback_leibler(p, q)
      # TODO: Change this to a more specific, custom-made exception.
      raise ArgumentError if p.size != q.size

      p.zip(q).reduce(0.0) do |acc, probs|
        acc += probs[0] * Math.log(probs[0] / probs[1])
      end
    end
  end

  extend Measurable::KullbackLeibler
end
