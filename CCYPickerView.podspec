Pod::Spec.new do |s|
    s.name         = 'CCYPickerView'
    s.version      = '1.0.3'
    s.summary      = 'easy way to use UIPickerView'
    s.homepage     = 'https://github.com/ChorYinChan/CCYPickerView'
    s.license      = 'MIT'
    s.authors      = {'ccy' => 'ccy4031@.qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/ChorYinChan/CCYPickerView.git', :tag => s.version}
    s.source_files = 'Classes/*'
    s.requires_arc = true
    
end