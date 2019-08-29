class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false 
    end
  end
  
  def execute_transaction
    binding.pry
    if self.status == "pending" && self.valid? == false
      self.status = "rejected"
      puts "Transaction rejected. Please check your account balance."
      else
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
    end
  end
end
end
