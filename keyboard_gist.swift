    // add Done button to numeric keypad  
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.Default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("doneButtonAction"))

        let items : [UIBarButtonItem] = [flexSpace, done]

        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.amountField.inputAccessoryView = doneToolbar
    }

    func doneButtonAction()
    {
        self.amountField.resignFirstResponder()
    }

