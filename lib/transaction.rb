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

    def add_to_transactions
        @product.remove_from_stock
        @@transactions << self
    end
end
