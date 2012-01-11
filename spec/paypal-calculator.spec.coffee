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

  it 'should not change standard rate with volume', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 1)
    expect(calculator.standard_rate).toEqual 0.036

    calculator = new paypalCalculator.PaypalCalculator(1000*10000+1, 1)
    expect(calculator.standard_rate).toEqual 0.036

  it 'should have the standard transaction fee', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 1)
    expect(calculator.standard_transaction_fee).toEqual 40

  it 'should have the micropayment transaction fee', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 1)
    expect(calculator.micropayment_transaction_fee).toEqual 7

  it 'should have the micropayment rate', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 1)
    expect(calculator.micropayment_rate).toEqual 0.05

  it 'should calculate standard fees', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 1)
    expect(calculator.standard_fees).toEqual 1000*0.036 + 1*40

    calculator = new paypalCalculator.PaypalCalculator(1000, 2)
    expect(calculator.standard_fees).toEqual 2*1000*0.036 + 2*40

  it 'should calculate micropayment fees', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 1)
    expect(calculator.micropayment_fees).toEqual 1000*0.05 + 1*7

    calculator = new paypalCalculator.PaypalCalculator(1000, 2)
    expect(calculator.micropayment_fees).toEqual 2*1000*0.05 + 2*7

  it 'should calculate merchant fees', ->
    calculator = new paypalCalculator.PaypalCalculator(1000, 1)
    expect(calculator.merchant_fees).toEqual 1000*0.036 + 1*40

    calculator = new paypalCalculator.PaypalCalculator(1000*10000+1, 2)
    expect(calculator.merchant_fees).toEqual Math.round(2*(1000*10000+1)*0.029 + 2*40)

  it 'should round fees', ->
    calculator = new paypalCalculator.PaypalCalculator(1, 1)
    expect(calculator.merchant_fees).toEqual 40
    expect(calculator.standard_fees).toEqual 40
    expect(calculator.micropayment_fees).toEqual 7
