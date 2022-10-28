//
//  QRscan_ViewController.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/28.
//

import UIKit
import Alamofire
import SwiftyJSON

import AVFoundation

class QRscan_ViewController:  UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var previewView: UIView!
    @IBOutlet var view_main: UIView!
    @IBOutlet weak var lb_qr: UILabel!
    
    var imageOrientation: AVCaptureVideoOrientation?
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var capturePhotoOutput: AVCapturePhotoOutput?
    var device: AVCaptureDevice?
    @IBOutlet weak var btn_back: UIBarButtonItem!
    @IBOutlet weak var lb_title: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ui_init()
        
        
        
        // Get an instance of the AVCaptureDevice class to initialize a
        // device object and provide the video as the media type parameter
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            fatalError("No video device found")
        }
        // handler chiamato quando viene cambiato orientamento
        self.imageOrientation = AVCaptureVideoOrientation.portrait
                              
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous deivce object
            let input = try AVCaptureDeviceInput(device: captureDevice)
                   
            // Initialize the captureSession object
            captureSession = AVCaptureSession()
                   
            // Set the input device on the capture session
            captureSession?.addInput(input)
                   
            // Get an instance of ACCapturePhotoOutput class
            capturePhotoOutput = AVCapturePhotoOutput()
            capturePhotoOutput?.isHighResolutionCaptureEnabled = true
                   
            // Set the output on the capture session
            captureSession?.addOutput(capturePhotoOutput!)
            captureSession?.sessionPreset = .high
                   
            // Initialize a AVCaptureMetadataOutput object and set it as the input device
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
                   
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
                   
            
            //Initialise the video preview layer and add it as a sublayer to the viewPreview view's layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
           
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
//            self.videoPreviewLayer?.frame = view.layer.bounds
            DispatchQueue.main.async {
                self.videoPreviewLayer?.frame = self.previewView.bounds
              }
            videoPreviewLayer?.connection?.videoOrientation = .portrait
//            self.videoPreviewLayer?.bounds = previewView.layer.bounds


//            self.videoPreviewLayer?.bounds = CGRect(x:0,y: 0,width: self.previewView.frame.size.width-40,height: self.previewView.frame.size.height)
//            self.videoPreviewLayer?.bounds = view.layer.frame

//            videoPreviewLayer?.frame = CGRect(x: previewView.layer.frame.origin.x, y:previewView.layer.frame.origin.y,width: previewView.frame.width,
//                                              height: previewView.frame.hight)
      //          previewView.layer.frame

            previewView.layer.insertSublayer(videoPreviewLayer!,at: 0)
//            videoPreviewLayer?.frame = view.frame

            //            DispatchQueue.main.async { in
//             }
            //start video capture
            captureSession?.startRunning()
                   
        } catch {
            //If any error occurs, simply print it out
            print(error)
            return
        }
        
    }
    
    @IBAction func back_press(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.captureSession?.startRunning()
    }
    
    // Find a camera with the specified AVCaptureDevicePosition, returning nil if one is not found
    func cameraWithPosition(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .unspecified)
        for device in discoverySession.devices {
            if device.position == position {
                return device
            }
        }
        
        return nil
    }
    
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is contains at least one object.
        if metadataObjects.count == 0 {
            return
        }
        
        //self.captureSession?.stopRunning()
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            if let outputString = metadataObj.stringValue {
                DispatchQueue.main.async {
                    self.showToast(message: String(outputString))
                }
            }
        }
        
    }
    
    func ui_init(){
        lb_qr.text = "QR SCAN"
        lb_qr.textColor = UIColor.white
        lb_qr.layer.borderWidth = 2.0
        lb_qr.layer.cornerRadius = 15
        lb_qr.layer.borderColor = UIColorFromRGB(rgbValue: Singleton.main_color).cgColor
        lb_qr.backgroundColor = UIColorFromRGB(rgbValue: Singleton.main_color)
        lb_qr.layer.masksToBounds = true
        
    }
    //RGB색상 변경 함수
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat((rgbValue & 0x0000FF)) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
    func showToast(message : String) {
           let width_variable:CGFloat = 10
           let toastLabel = UILabel(frame: CGRect(x: width_variable, y: self.view.frame.size.height-100, width: view.frame.size.width-2*width_variable, height: 35))
           // 뷰가 위치할 위치를 지정해준다. 여기서는 아래로부터 100만큼 떨어져있고, 너비는 양쪽에 10만큼 여백을 가지며, 높이는 35로
           toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
           toastLabel.textColor = UIColor.white
           toastLabel.textAlignment = .center;
           toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
           toastLabel.text = message
           toastLabel.alpha = 1.0
           toastLabel.layer.cornerRadius = 10;
           toastLabel.clipsToBounds  =  true
           self.view.addSubview(toastLabel)
           UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
               toastLabel.alpha = 0.0
           }, completion: {(isCompleted) in
               toastLabel.removeFromSuperview()
           })
       }
    
    
    
}
