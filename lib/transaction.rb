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

    def add_to_transactions
        @product.remove_from_stock
        @@transactions << self
    end
end
