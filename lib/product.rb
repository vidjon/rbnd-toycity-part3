# product.rb

class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(product_title)
      @@products.find { |e|  e.title == product_title }
  end

  def self.in_stock
      @@products.select { |e| e.in_stock?  }
  end

  public

  def in_stock?
      @stock > 0
  end

  def remove_from_stock
        @stock -= 1
  end

  private

  def add_to_products
    if !@@products.select { |e|  e.title == @title }.empty?
        raise DuplicateProductError, "'#{@title}' already exists."
    else
        @@products << self
    end
  end
end
