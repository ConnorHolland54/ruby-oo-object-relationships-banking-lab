class BankAccount
    attr_accessor :balance, :status, :valid
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        BankAccount.all << self
    end

    def self.all
        @@all
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if status == "open" && @balance > 0
            return true
        else
            return false
        end
    end

    def close_account
        @status = "closed"
    end

    def balance
        @balance
    end

end
