# customer.rb

class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(customer_name)
      @@customers.find { |e|  e.name == customer_name }
  end

  private

  def add_to_customers
    if !@@customers.select { |e|  e.name == @name }.empty?
        raise DuplicateCustomerError, "'#{@name}' already exists."
    else
        @@customers << self
    end
  end
end
