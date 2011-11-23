require "coffee-script"
paypalCalculator = require "../lib/PaypalCalculator"

describe 'paypal calculator', ->
  it 'should calulater merchant rate', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 10)
    expect(calculator.basic_rate).toEqual 0.036
    expect(calculator.merchant_rate).toEqual 0.036
