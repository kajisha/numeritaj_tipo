class PaymentStatus < NumeritajTipo::EnumBase
end

class PaymentStatus::Pending < PaymentStatus
  def initialize
    @value = :pending
  end
end

class PaymentStatus::Approved < PaymentStatus
  def initialize
    @value = :approved
  end
end

class PaymentStatus::Declined < PaymentStatus
  def initialize
    @value = :declined
  end
end
