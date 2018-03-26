require 'prime'
require 'pry'

class Finder
  def initialize(target)
    @target = target
    @primal_array = [2]
    @iterations = 1
  end

  def find_sum
    @primal_array = [2]
    @iterations = 1
    arr = [[1, 2]]
    idx = 3
    sum = 2
    loop do
      if prime?(idx)
        @primal_array << idx
        @iterations += 1
        sum += idx
        arr << [@iterations, sum]
      end
      idx += 2
      break if sum > @target
    end
    arr
  end

  def result
    r = 0
    iter = 0
    arr = find_sum.reverse
    arr.each do |i, n|
      next unless prime?(n)
      r = n
      iter = i
      break if prime?(n)
    end
    "Iteration: #{iter} | Number: #{r}"
  end

  def prime?(number)
    r = true
    @primal_array.each do |n|
      next if number % n == 1
      r = false if (number % n).zero?
    end
    r
  end
end
