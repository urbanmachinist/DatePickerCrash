# DatePickerCrash
Project showing the date picker crash in ios.


The storyboard has a single view which is connected to the ViewController.swift class. 
The view has just 2 UITextFields, and each has an IBOutlet.
Steps: 

1. Run the project.
2. Tap on the top text field -> shows the date picker.
3. Tap on the bottom text field -> shows the custom picker -> select a value, for eg. 9.
4. Tap on the top text field again -> CRASH!
