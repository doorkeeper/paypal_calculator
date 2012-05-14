root = exports ? this
class root.PaypalCalculator
  constructor: (@avg_transaction, @transactions) ->
    base = @avg_transaction * @transactions
    if base <= 300000
      @merchant_rate = 0.036
      @merchant_rate_bracket = [0, 300000]
    else if base <= 1000000
      @merchant_rate = 0.034
      @merchant_rate_bracket = [300001, 1000000]
    else if base <= 10000000
      @merchant_rate = 0.032
      @merchant_rate_bracket = [1000001, 10000000]
    else
      @merchant_rate = 0.029
      @merchant_rate_bracket = [10000000, null]
    @standard_fees = Math.round(this.standard_rate * base + @transactions * this.standard_transaction_fee)
    @micropayment_fees = Math.round(this.micropayment_rate * base + @transactions * this.micropayment_transaction_fee)
    @merchant_fees = Math.round(this.merchant_rate * base + @transactions * this.standard_transaction_fee)
  standard_rate: 0.036
  standard_transaction_fee: 40
  micropayment_transaction_fee: 7
  micropayment_rate: 0.05
