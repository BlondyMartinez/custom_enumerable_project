module Enumerable
  def my_each_with_index
    index = -1;
    my_each{ |element| yield(element, index += 1) }
  end

  def my_select
    selection = []
    my_each { |element| selection.push(element) if yield(element) }
    selection
  end

  def my_all?
    my_each { |element| return false if !yield(element)}
    return true
  end

  def my_any?
    my_each { |element| return true if yield(element) }
    return false
  end

  def my_none?
    my_each { |element| return false if yield(element) }
    return true
  end

  def my_count
    if block_given?
      count = 0;
      my_each { |element| count += 1 if yield(element) } 
      return count
    end
    self.size
  end

  def my_map
    map = []
    my_each { |element| map.push(yield(element)) }
    map
  end

  def my_inject(init)
    sum = init
    my_each { |element| sum = yield(sum, element) }
    sum
  end
end

class Array
  def my_each
    for element in self
      yield element
    end
  end
end