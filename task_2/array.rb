class Array
  def rebuild!
    map! do |item|
      item.is_a?(Array) ? item.map { |i| yield(i, item.size) } : yield(item, size)
    end
  end
end
