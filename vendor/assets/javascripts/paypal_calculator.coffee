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
    @standard_fees = Math.round(this.standard_rate * base + @transactions * this.standard_transaction_fee)
    @micropayment_fees = Math.round(this.micropayment_rate * base + @transactions * this.micropayment_transaction_fee)
    @merchant_fees = Math.round(this.merchant_rate * base + @transactions * this.standard_transaction_fee)
  standard_rate: 0.036
  standard_transaction_fee: 40
  micropayment_transaction_fee: 7
  micropayment_rate: 0.05
