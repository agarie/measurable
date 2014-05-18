module Measurable
  module Levenshtein

    # call-seq:
    #     levenshtein(u, v) -> Integer
    #
    # Give the edit distance between two binary sequences +u+ and +v+ where each
    # edit (insertion, deletion, substitution) required to change on into the
    # other increments the total distance.
    #
    # For example:
    #   levenshtein('kitten', 'sitting') == 3
    #
    # Because
    # 1. kitten -> sitten (substitution "s" for "k")
    # 2. sitten -> sittin (substitution "i" for "e")
    # 3. sittin -> sitting (insertion of "g" at the end)
    #
    # See: http://en.wikipedia.org/wiki/Levenshtein_distance
    #
    # Arguments:
    # - +u+ -> Array or String.
    # - +v+ -> Array or String.
    # Returns:
    # - Integer value representing the Levenshtein distance between +u+ and +v+.
    #
    def levenshtein(u, v)
      return 0 if u == v
      return u.size if v.size == 0
      return v.size if u.size == 0

      matrix = Array.new(u.size+1) { (0..v.size).to_a }

      if v.size < u.size
        u, v = v, u
      end

      (1..u.size).each do |i|
        (1..v.size).each do |j|
          if u[i] == v[j]
            matrix[i][j] = matrix[i-1][j-1]
          else
            matrix[i][j] = [
              matrix[i-1][j] + 1,   # deletion
              matrix[i][j-1] + 1,   # insertion
              matrix[i-1][j-1] + 1, # substitution
            ].min
          end
        end
      end

      matrix[u.size][v.size]
    end
  end

  extend Measurable::Levenshtein
end
