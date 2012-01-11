require "coffee-script"
paypalCalculator = require "../vendor/assets/javascripts/paypal_calculator"

describe 'paypal calculator', ->
  it 'should calculate merchant rate', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 1)
    expect(calculator.merchant_rate).toEqual 0.036

    calculator = new paypalCalculator.PaypalCalculator(30*10000, 1)
    expect(calculator.merchant_rate).toEqual 0.036

    calculator = new paypalCalculator.PaypalCalculator(30*10000+1, 1)
    expect(calculator.merchant_rate).toEqual 0.034

    calculator = new paypalCalculator.PaypalCalculator(100*10000, 1)
    expect(calculator.merchant_rate).toEqual 0.034

    calculator = new paypalCalculator.PaypalCalculator(100*10000+1, 1)
    expect(calculator.merchant_rate).toEqual 0.032

    calculator = new paypalCalculator.PaypalCalculator(1000*10000, 1)
    expect(calculator.merchant_rate).toEqual 0.032

    calculator = new paypalCalculator.PaypalCalculator(1000*10000+1, 1)
    expect(calculator.merchant_rate).toEqual 0.029

  it 'should not change basic rate with volume', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 1)
    expect(calculator.basic_rate).toEqual 0.036

    calculator = new paypalCalculator.PaypalCalculator(1000*10000+1, 1)
    expect(calculator.basic_rate).toEqual 0.036
