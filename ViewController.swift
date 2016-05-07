import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldA: UITextField!
    @IBOutlet weak var textFieldB: UITextField!
    let datePickerA = UIDatePicker()
    let pickerB     = UIPickerView()
    let bDataSource = BDataSource()
    var date = NSDate()
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // init A
        self.datePickerA.datePickerMode = UIDatePickerMode.DateAndTime
        self.datePickerA.addTarget(self, action: #selector(datePickerAChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        textFieldA.inputView = datePickerA
        
        // init B
        self.pickerB.dataSource   = bDataSource //bDataSource is the datasource and delegate class instance
        self.pickerB.delegate     = bDataSource
        self.textFieldB.inputView = pickerB
        
        // Add observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notificationReceived(_:)), name: "foo", object: nil)
        
    }
    
    func datePickerAChanged(picker: UIDatePicker){
        self.textFieldA.text = "\(picker.date)"
    }
    
    func notificationReceived(notification: NSNotification) {
        
        switch notification.name {
        case "foo":
            
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: self.date)
            let year       = abs(components.year) + self.bDataSource.deltaYears
            
            // Update the year component
            components.setValue(year, forComponent: .Year)
            
            let updatedDate = calendar.dateFromComponents(components)!
            self.datePickerA.setDate(updatedDate, animated: false)
            self.datePickerAChanged(self.datePickerA)
            
        default:
            break
            
        }
        
    }
    
}

