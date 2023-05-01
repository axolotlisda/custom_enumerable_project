module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    my_each do |v|
      yield v, i
      i += 1
    end
  end

  def my_all?
    my_each do |v|
      return false unless yield(v)
    end
    true
  end

  def my_any?
    my_each do |v|
      return true if yield(v)
    end
    false
  end

  def my_count
    i = 0
    c = 0
    for v in self
      if block_given?
        c += 1 if yield(v)

      elsif block_given? == false
        c += 1
      end
    end
    c
  end

  def my_inject(a)
    return to_enum(:my_inject) unless block_given?
    for v in self 
      a = yield(a, v)
    end
    a
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    i = 0
    for v in self
      self[i] = yield(v)
      i += 1
    end
  end

  def my_none?
    for v in self
      return false if yield(v) == true
    end
    true
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    selected = []
    for v in self
      if yield(v) == true
        selected.push(v)
      else
      end
    end
    selected
  end



end # module end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for v in self do
      yield v
    end
  end
end
