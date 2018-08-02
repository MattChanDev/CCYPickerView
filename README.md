# CCYPickerView

//example

let array = ["lebron","kobe","kevin","james"];

PickerManager.share.showPicker(data: array, superView: self.view) { (model) in
            print("selected\(model)");
        }
