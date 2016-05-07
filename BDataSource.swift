import Foundation
import UIKit

class BDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Class variables
    var pickerDataSource: [String]  = []
    private var selectedYears = 0
    private var selectedYearsLastValue = 0
    var deltaYears = 0
    
    override init() {
        super.init()
        for i in 1...100 {
            self.pickerDataSource.append(String(i))
        }
    }
    
    // MARK: UIPickerViewDataSource
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDataSource.count
    }
    
    // MARK: UIPIckerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selection = self.pickerDataSource[row]
        self.selectedYearsLastValue = self.selectedYears
        self.selectedYears = Int(selection)!
        self.deltaYears = self.selectedYears - self.selectedYearsLastValue
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "foo", object: nil))
    }
    
}