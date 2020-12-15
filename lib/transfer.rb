require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :amount, :status, :receiver

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @amount = amount
    @receiver = receiver
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else 
      return false
    end
  end

  def execute_transaction
    if !self.valid? || @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end



end
