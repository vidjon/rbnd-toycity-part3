# transaction.rb

class Transaction
    attr_reader :id, :product, :customer

    @@id = 1
    @@transactions = []

    def initialize(customer, product)
        @id = @@id
        @@id += 1
        @product = product
        @customer = customer
        add_to_transactions
    end

    def self.all
      @@transactions
    end

    def self.find(id)
        @@transactions.find { |e| e.id == id  }
    end

    def self.find_by_value(options)
        customer_parameter = options.has_key?(:customer)
        product_parameter = options.has_key?(:product)

        if customer_parameter || product_parameter
            return @@transactions.select {
                |e| (!customer_parameter || e.customer == options[:customer]) &&
                    (!product_parameter || e.product == options[:product])}
        end

        return []
    end

    def self.total_revenues
        unless @@transactions.empty? then
            @@transactions.inject(0){|result, element| result + element.product.price}
        else
            "No transactions available"
        end
    end

    def add_to_transactions
        @product.remove_from_stock
        @@transactions << self
    end
end
