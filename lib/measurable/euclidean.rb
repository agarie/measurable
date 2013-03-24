module Measurable
  def euclidean(u, v)
    sum = 0.0
    
    u.zip(v).each do |ary|
      sum += (ary.first - ary.last)**2
    end
    
    Math.sqrt(sum)
  end
  
  def euclidean_squared(u, v)
    u.zip(v).reduce(0.0) do |acc, ary|
      acc += (ary.first - ary.last)**2
    end
  end
end