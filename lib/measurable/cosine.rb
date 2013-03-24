module Measurable
  class << self
    def cosine(u, v)
      dot_product = dot(u, v)
      normalization = self.euclidean_normalize * other.euclidean_normalize

      handle_nan(dot_product / normalization)
    end
  end
end