require 'minitest/autorun'
require './object_oriented/vending_machine'
require './object_oriented/drink'
require './object_oriented/coin'
require './object_oriented/drink_type'
require './object_oriented/payment'
require './object_oriented/stock'
class VendingMachineTest < Minitest::Test
  def setup
    @vm = VendingMachine.new
  end

  def test_500円でコーラを購入
    drink = @vm.buy(Coin::FIVE_HUNDRED,DrinkType::COKE)
    change = @vm.refund

    assert_equal(DrinkType::COKE,drink.kind)
    assert_equal([Coin::ONE_HUNDRED] * 4, change)
  end

  def test_コーラの在庫が無いときにコーラは買えない
    @vm.buy(100, DrinkType::COKE)
    @vm.buy(100, DrinkType::COKE)
    @vm.buy(100, DrinkType::COKE)
    @vm.buy(100, DrinkType::COKE)
    @vm.buy(100, DrinkType::COKE)
    drink = @vm.buy(100, DrinkType::COKE)
    change = @vm.refund

    assert_nil(drink)
    assert_equal(100, change)
  end

  def testダイエットコーラの在庫が無いときにダイエットコーラは買えない
    @vm.buy(100, DrinkType::DIET_COKE)
    @vm.buy(100, DrinkType::DIET_COKE)
    @vm.buy(100, DrinkType::DIET_COKE)
    @vm.buy(100, DrinkType::DIET_COKE)
    @vm.buy(100, DrinkType::DIET_COKE)
    drink = @vm.buy(100, DrinkType::DIET_COKE)
    change = @vm.refund

    assert_equal(nil, drink)
    assert_equal(100, change)
  end

  def testお茶の在庫が無いときにお茶は買えない
    @vm.buy(100, DrinkType::TEA)
    @vm.buy(100, DrinkType::TEA)
    @vm.buy(100, DrinkType::TEA)
    @vm.buy(100, DrinkType::TEA)
    @vm.buy(100, DrinkType::TEA)
    drink = @vm.buy(100, DrinkType::TEA)
    change = @vm.refund

    assert_equal(nil, drink)
    assert_equal(100, change)
  end

  def test_釣り銭が足りないときにコーラは買えない
    @vm.buy(500, DrinkType::COKE)
    @vm.refund
    @vm.buy(500, DrinkType::COKE)
    @vm.refund
    drink = @vm.buy(500, DrinkType::COKE)
    change = @vm.refund

    assert_nil(drink)
    assert_equal(500, change)
  end
end
