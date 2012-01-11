root = exports ? this
class root.PaypalCalculator
  constructor: (@avg_transaction, @transactions) ->
    base = @avg_transaction * @transactions
    @merchant_rate = if base <= 300000
      0.036
    else if base <= 1000000
      0.034
    else if base <= 10000000
      0.032
    else
      0.029
  basic_rate: 0.036
