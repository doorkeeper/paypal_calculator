root = exports ? this
class root.PaypalCalculator
  constructor: (@avg_transaction, @transactions) ->
    @merchant_rate = this.basic_rate
  basic_rate: 0.036
