class Series
  attr_reader :series_string

  def initialize(series_string)
    @series_string = series_string
  end  

  def slices(length_of_slice)
    raise ArgumentError.new("Slice size is too big.") if length_of_slice > series_string.length
    series_array = series_string.chars.map { |char| char.to_i }
    series_array.map!.with_index do |char, i| 
      series_array[i, length_of_slice] if i + length_of_slice <= series_string.length
    end
    series_array.reject { |element| element.nil? }
  end  
end