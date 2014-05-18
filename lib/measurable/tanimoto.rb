require 'measurable/jaccard'

module Measurable
  module Tanimoto

    # call-seq:
    #     tanimoto(u, v) -> Float
    #
    # Tanimoto distance is a coefficient explicitly chosen such as to allow for
    # two dissimilar specimens to be similar to a third one. This breaks the
    # triangle inequality, thus this isn't a metric.
    #
    # More information and references on this are needed. It's left here mostly
    # as a piece of curiosity.
    #
    # See: # http://en.wikipedia.org/wiki/Jaccard_index#Tanimoto.27s_Definitions_of_Similarity_and_Distance
    #
    # Arguments:
    # - +u+ -> An array of Numeric objects.
    # - +v+ -> An array of Numeric objects.
    # Returns:
    # - A measure of the similarity between +u+ and +v+.
    # Raises:
    # - +ArgumentError+ -> The sizes of +u+ and +v+ don't match.
    def tanimoto(u, v)
      # TODO: Change this to a more specific, custom-made exception.
      raise ArgumentError if u.size != v.size

      -Math.log2(jaccard_index(u, v))
    end

    def self.extended(base) # :nodoc:
      # Tanimoto similarity is the same as Jaccard similarity.
      base.instance_eval do
        extend Measurable::Jaccard
        alias :tanimoto_similarity :jaccard
      end
      super
    end

    def self.included(base) # :nodoc:
      base.class_eval do
        include Measurable::Jaccard
        alias :tanimoto_similarity :jaccard
      end
      super
    end
  end

  extend Measurable::Tanimoto
end
