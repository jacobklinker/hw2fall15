class CartesianProduct
  include Enumerable
  
  def initialize(list1, list2)
    @cross_product = []
    list1.each do |x|
      list2.each do |y|
        @cross_product << [x, y]
      end
    end
  end
  
  def each
    @cross_product.each { |x| yield x }
  end

end