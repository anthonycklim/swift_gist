// format number as currency
let text = value.stringByReplacingOccurrencesOfString(currencyFormatter.currencySymbol, withString: "").stringByReplacingOccurrencesOfString(currencyFormatter.groupingSeparator, withString: "").stringByReplacingOccurrencesOfString(currencyFormatter.decimalSeparator, withString: "")
amountField.text = currencyFormatter.stringFromNumber((text as NSString).doubleValue / 100.0)

// extension formatting as currency in UITextField
extension PaymentViewController: UITextFieldDelegate {
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    // Construct the text that will be in the field if this change is accepted
    let oldText = textField.text! as NSString
    var newText = oldText.stringByReplacingCharactersInRange(range, withString: string) as NSString!
    var newTextString = String(newText)
    
    let digits = NSCharacterSet.decimalDigitCharacterSet()
    var digitText = ""
    for c in newTextString.unicodeScalars {
      if digits.longCharacterIsMember(c.value) {
        digitText.append(c)
      }
    }
    
    let formatter = NSNumberFormatter()
    formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
    formatter.locale = NSLocale(localeIdentifier: "en_US")
    let numberFromField = (NSString(string: digitText).doubleValue)/100
    newText = formatter.stringFromNumber(numberFromField)
    
    textField.text = newText as String
    
    return false
  }
}
