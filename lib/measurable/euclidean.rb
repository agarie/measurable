module Measurable
  class << self
    # Add documentation here!
    def euclidean(u, v = nil)
      # If the second argument is nil, the method should return the norm of
      # vector u. For this, we need the distance between u and the origin.
      if v.nil?
        v = Array.new(u.size, 0)
      end
      
      # We could make it work with vector of different sizes because of #zip
      # but it's unreliable. It's better to just throw an exception.
      # TODO: Change this to a more specific, custom-made exception.
      raise ArgumentError if u.size != v.size
      
      sum = u.zip(v).reduce(0.0) do |acc, ary|
        acc += (ary[0] - ary[-1])**2
      end
    
      Math.sqrt(sum)
    end
  
    def euclidean_squared(u, v = nil)
      # If the second argument is nil, the method should return the norm of
      # vector u. For this, we need the distance between u and the origin.
      if v.nil?
        v = Array.new(u.size, 0)
      end
      
      # We could make it work with vector of different sizes because of #zip
      # but it's unreliable. It's better to just throw an exception.
      # TODO: Change this to a more specific, custom-made exception.
      raise ArgumentError if u.size != v.size
      
      u.zip(v).reduce(0.0) do |acc, ary|
        acc += (ary[0] - ary[-1])**2
      end
    end
  end
end