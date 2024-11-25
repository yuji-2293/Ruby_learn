require './object_oriented/money/cash_box'
require './object_oriented/money/change'
require './object_oriented/money/payment'

class CoinMech
  def initialize
    @cash_box = CashBox.new(10)
  end

  def put(coin)
    @payment = Payment.new(coin)
  end

  def not_have_change?
    @payment.need_change? && @cash_box.not_have_change?
  end

  def refund
    @payment.refund
  end

  def commit
    @payment.commit(@cash_box)
  end
end
