module Measurable
  class << self
    def euclidean(u, v)
      sum = 0.0
    
      u.zip(v).each do |ary|
        sum += (ary[0] - ary[-1])**2
      end
    
      Math.sqrt(sum)
    end
  
    def euclidean_squared(u, v)
      u.zip(v).reduce(0.0) do |acc, ary|
        acc += (ary[0] - ary[-1])**2
      end
    end
  end
end