require './object_oriented/storage'
require './object_oriented/coin_mech'
require './object_oriented/drink'

class VendingMachine

  def initialize
    @storage = Storage.new
    @coin_mech = CoinMech.new
  end

  def buy(payment, kind_of_drink)
    @coin_mech.put(payment)

    if @coin_mech.not_have_change?
      return nil
    end

    if @storage.not_have_stock?(kind_of_drink)
      return nil
    end

    @coin_mech.commit
    @storage.take_out(kind_of_drink)
  end

  def refund
    @coin_mech.refund
  end
end
