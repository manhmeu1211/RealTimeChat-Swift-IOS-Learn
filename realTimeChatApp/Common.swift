import UIKit
import Foundation

open class ToastView: UILabel {
    
    var overlayView = UIView()
    var backView = UIView()
    var lbl = UILabel()
    
    class var shared: ToastView {
        struct Static {
            static let instance: ToastView = ToastView()
        }
        return Static.instance
    }
    
    func setup(_ view: UIView,txt_msg:String)
    {
        let white = UIColor ( red: 1/255, green: 0/255, blue:0/255, alpha: 0.0 )
        
        backView.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height)
        backView.center = view.center
        backView.backgroundColor = white
        view.addSubview(backView)
        
        overlayView.frame = CGRect(x: 0, y: 0, width: view.frame.width - 60  , height: 50)
        overlayView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height - 100)
        overlayView.backgroundColor = UIColor.black
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.alpha = 0
        
        lbl.frame = CGRect(x: 0, y: 0, width: overlayView.frame.width, height: 50)
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.white
        lbl.center = overlayView.center
        lbl.text = txt_msg
        lbl.textAlignment = .center
        lbl.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        overlayView.addSubview(lbl)
        
        view.addSubview(overlayView)
    }
    
    open func short(_ view: UIView,txt_msg:String) {
        self.setup(view,txt_msg: txt_msg)
        //Animation
        UIView.animate(withDuration: 1, animations: {
            self.overlayView.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 1, animations: {
                self.overlayView.alpha = 0
            }) { (true) in
                UIView.animate(withDuration: 1, animations: {
                    DispatchQueue.main.async(execute: {
                        self.overlayView.alpha = 0
                        self.lbl.removeFromSuperview()
                        self.overlayView.removeFromSuperview()
                        self.backView.removeFromSuperview()
                    })
                })
            }
        }
    }
    
    open func long(_ view: UIView,txt_msg:String) {
        self.setup(view,txt_msg: txt_msg)
        //Animation
        UIView.animate(withDuration: 2, animations: {
            self.overlayView.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 2, animations: {
                self.overlayView.alpha = 0
            }) { (true) in
                UIView.animate(withDuration: 2, animations: {
                    DispatchQueue.main.async(execute: {
                        self.overlayView.alpha = 0
                        self.lbl.removeFromSuperview()
                        self.overlayView.removeFromSuperview()
                        self.backView.removeFromSuperview()
                    })
                })
            }
        }
    }
}



open class NetWorkService {
    
    class var getInstance: NetWorkService {
         struct Static {
             static let instance: NetWorkService = NetWorkService()
         }
         return Static.instance
     }
    
    
    func loadImageFromInternet(url : String, completionHandler: @escaping (Data, String) -> () ){
        
          let url = URL(string: url)
          
          do {
              let data = try Data(contentsOf: url!)
              completionHandler(data, "Success")
          } catch {
          
          }
      }
          
}
