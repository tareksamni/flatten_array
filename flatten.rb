class Array
  def my_flatten
    [].tap do |flattened|
      each do |item|
        flattened.push(*(item.is_a?(Array) ? item.my_flatten : item))
      end
    end
  end
end