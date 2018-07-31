//
//  AppUtility.swift
//  Nivedita Gupta
//
//  Created by Nivedita Gupta on 09/10/15.
//  Copyright (c) 2015 Nivedita Gupta. All rights reserved.
//

import UIKit

let showLog = true

func trimWhiteSpace(str: String) -> String {
    let trimmedString = str.trimmingCharacters(in: NSCharacterSet.whitespaces)
    return trimmedString
}

func win_width() -> CGFloat {
    let bounds = UIScreen.main.bounds
    let width = bounds.size.width
    return width
}

func win_height() -> CGFloat {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height
    return height
}

func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let attrs: [NSAttributedStringKey: Any] = [.font: font]
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let attrs: [NSAttributedStringKey: Any] = [.font: font]
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        
        return ceil(boundingBox.width)
    }
}

func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

// custom log
func logInfo(_ message: String, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    if (showLog) {
        print("\(function): \(line): \(message)")
    }
}

var CurrentTimestamp: String {
    return "\(Date().timeIntervalSince1970)"
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Get AppFont with Size <<<<<<<<<<<<<<<<<<<<<<<<*/
func kAppFontRegularWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name:"Lato-Regular", size: size)!
}
func kAppFontBoldWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name:"Lato-Bold", size: size)!
}
func kAppFontMediumBoldWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name:"Lato-Black", size: size)!
}
func kAppFontMediumBoldItalicWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name:"Lato-BlackItalic", size: size)!
}
func kAppFontLightWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name:"Lato-Light", size: size)!
}
func kAppFontItalicWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name:"Lato-Italic", size: size)!
}
func kAppFontLightItalicWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name:"Lato-LightItalic", size: size)!
}
func kAppFontBoldItalicWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name:"Lato-BoldItalic", size: size)!
}


func getRGBA(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: (r/255.0), green: (g/255.0), blue: (b/255.0), alpha: a)
}

func getImageFromColor(_ color:UIColor) -> UIImage {
    
    let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size);
    let context: CGContext = UIGraphicsGetCurrentContext()!
    context.setFillColor(color.cgColor);
    context.fill(rect);
    let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext();
        
    return img;
}

func formatDate(date: Date)-> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: date)
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> NSUserDefaults <<<<<<<<<<<<<<<<<<<<<<<<*/

func setValueInUserDefaults(_ value: AnyObject, key: String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

func setBooInUserDefaults(value: Bool, key: String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

func setStringInUserDefaults(value: String, key: String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

func getBoolFromUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.bool(forKey: key)
}

func getStringFromUserDefaults(key: String) -> String {
    return UserDefaults.standard.string(forKey: key)!
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Get WeekDay for date <<<<<<<<<<<<<<<<<<<<<<<<*/
//EEEE for weekday, //"dd/MM/yy", //"yyyy-MM-dd"
//"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZ" -->UTC date formate

func getStringFromDate(_ date:Date, format:NSString) -> NSString {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format as String
    
    return dateFormatter.string(from: date) as NSString
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Get UnderLined Attributed String <<<<<<<<<<<<<<<<<<<<<<<<*/
func getUnderLinedAttributedString(_ str:NSString) -> NSAttributedString {
    
    let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
    let underlineAttributedString = NSAttributedString(string: str as String, attributes: underlineAttribute)
    
    return underlineAttributedString
}
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Get Attributed String <<<<<<<<<<<<<<<<<<<<<<<<*/
func getAttributedString(_ fullStr:NSString, attributableStr:NSString, color:UIColor, font:UIFont) -> NSAttributedString {
   
    let attributes = [
        NSAttributedStringKey.font : UIFont(name: "Helvetica Neue", size: 12.0)!,
        NSAttributedStringKey.underlineStyle : 1,
        NSAttributedStringKey.foregroundColor : UIColor.red,
        NSAttributedStringKey.textEffect : NSAttributedString.TextEffectStyle.letterpressStyle,
        NSAttributedStringKey.strokeWidth : 3.0
        ] as [NSAttributedStringKey : Any]
    
    let atriString = NSAttributedString(string: "My Attributed String", attributes: attributes)
    
    return atriString
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Default Setup ActivityButton <<<<<<<<<<<<<<<<<<<<<<<<*/


/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Setting corner for UIButton <<<<<<<<<<<<<<<<<<<<<<<<*/
func setCornerForButton(_ button:UIButton, cornerRadius:CGFloat, borderWidth:CGFloat, borderColor:UIColor) {
    button.layer.cornerRadius =  cornerRadius
    button.layer.borderColor = borderColor.cgColor
    button.layer.borderWidth = borderWidth
    button.clipsToBounds = true
}
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Setting corner for UILabel <<<<<<<<<<<<<<<<<<<<<<<<*/
func setCornerForLabel(_ label:UILabel, cornerRadius:CGFloat, borderWidth:CGFloat, borderColor:UIColor) {
    label.layer.cornerRadius =  cornerRadius
    label.layer.borderColor = borderColor.cgColor
    label.layer.borderWidth = borderWidth
    label.clipsToBounds = true
}
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Setting corner for UIButton <<<<<<<<<<<<<<<<<<<<<<<<*/
func setCornerForView(_ view:UIView, cornerRadius:CGFloat, borderWidth:CGFloat, borderColor:UIColor) {
    view.layer.cornerRadius =  cornerRadius
    view.layer.borderColor = borderColor.cgColor
    view.layer.borderWidth = borderWidth
    view.clipsToBounds = true;
}
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Setting corner for UIButton <<<<<<<<<<<<<<<<<<<<<<<<*/
func setCornerForImageView(_ imageView:UIImageView, cornerRadius:CGFloat, borderWidth:CGFloat, borderColor:UIColor) {
    imageView.layer.cornerRadius =  cornerRadius
    imageView.layer.borderColor = borderColor.cgColor
    imageView.layer.borderWidth = borderWidth
    imageView.clipsToBounds = true
}
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Setting corner for UITextField <<<<<<<<<<<<<<<<<<<<<<<<*/
func setCornerForTextField(_ textField:UITextField, cornerRadius:CGFloat, borderWidth:CGFloat, borderColor:UIColor) {
    textField.layer.cornerRadius =  cornerRadius
    textField.layer.borderColor = borderColor.cgColor
    textField.layer.borderWidth = borderWidth
    textField.clipsToBounds = true
}
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Setting corner for UITextView <<<<<<<<<<<<<<<<<<<<<<<<*/
func setCornerForTextView(_ textView:UITextView, cornerRadius:CGFloat, borderWidth:CGFloat, borderColor:UIColor) {
    textView.layer.cornerRadius =  cornerRadius
    textView.layer.borderColor = borderColor.cgColor
    textView.layer.borderWidth = borderWidth
    textView.clipsToBounds = true
}

// convert images into base64 and keep them into string
func convertImageToBase64(_ image: UIImage, compressionQuality:CGFloat) -> String {
    
    let imageData = UIImageJPEGRepresentation(image, compressionQuality)
    //let base64String = imageData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
    
    let base64String = imageData!.base64EncodedString(options: [])
    
    return base64String
    
}// end convertImageToBase64

func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
    if let data = text.data(using: String.Encoding.utf8) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
            return json
        } catch {
            //print("Something went wrong    \(text)")
        }
    }
    return nil
}



func giveLeftPaddingToTextField(_ textField: UITextField, width: Int , height: Int) {
        
    let leftPaddingView = UIView(frame: CGRect(x: 0,y: 0, width: width, height: height))
    textField.leftView = leftPaddingView
    textField.leftViewMode = .always
}
    
func isTextFieldEmpty (_ valueFromTextField: String) -> Bool {
        
    let rawString: String = valueFromTextField
    let whitespace = CharacterSet.whitespacesAndNewlines
    let trimmed: String = rawString.trimmingCharacters(in: whitespace)
    if trimmed.count == 0 {
        return false
    }
    else{
        return true
    }
}

class AppUtility: NSObject {
    
    // Date from unix timestamp from Date
    class func date(_ timestamp:Double) -> Date {
        return Date(timeIntervalSince1970: timestamp)
    }
   
    /*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Changing icon color according to theme <<<<<<<<<<<<<<<<<<<<<<<<*/
    class func getColoredImage(_ image:UIImage, color:UIColor) -> UIImage {
        
        var s = image.size // CGSize
        s.height *= image.scale
        s.width *= image.scale
        
        UIGraphicsBeginImageContext(s)
        
        var contextRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: s)
        
        // Retrieve source image and begin image context
        let itemImageSize = s //CGSize
        
        let xVal = (contextRect.size.width - itemImageSize.width)/2
        let yVal = (contextRect.size.height - itemImageSize.height)
        
        //let itemImagePosition = CGPoint(x: ceilf(xFloatVal), y: ceilf(yVal)) //CGPoint
        
        let itemImagePosition = CGPoint(x: xVal, y: yVal) //CGPoint
        
        UIGraphicsBeginImageContext(contextRect.size)
        
        let c = UIGraphicsGetCurrentContext() //CGContextRef
        
        // Setup shadow
        // Setup transparency layer and clip to mask
        c?.beginTransparencyLayer(auxiliaryInfo: nil)
        c?.scaleBy(x: 1.0, y: -1.0)
        
        //CGContextRotateCTM(c, M_1_PI)
        
        c?.clip(to: CGRect(x: itemImagePosition.x, y: -itemImagePosition.y, width: itemImageSize.width, height: -itemImageSize.height), mask: image.cgImage!)
        
        // Fill and end the transparency layer
        let colorSpace = color.cgColor.colorSpace //CGColorSpaceRef
        let model = colorSpace?.model //CGColorSpaceModel
        
        let colors = color.cgColor.components
        
        if (model == .monochrome) {
            c?.setFillColor(red: (colors?[0])!, green: (colors?[0])!, blue: (colors?[0])!, alpha: (colors?[1])!)
        } else {
            c?.setFillColor(red: (colors?[0])!, green: (colors?[1])!, blue: (colors?[2])!, alpha: (colors?[3])!)
        }
        
        contextRect.size.height = -contextRect.size.height
        contextRect.size.height -= 15
        c?.fill(contextRect)
        c?.endTransparencyLayer()
        
        let img = UIGraphicsGetImageFromCurrentImageContext() //UIImage
        
        let img2 = UIImage(cgImage: (img?.cgImage!)!, scale: image.scale, orientation: image.imageOrientation)
        
        UIGraphicsEndImageContext()
        
        return img2
    }
    
}

//dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"
