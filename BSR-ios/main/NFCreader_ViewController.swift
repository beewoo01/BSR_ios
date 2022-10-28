//
//  NFCreader_ViewController.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/28.
//

import UIKit
import Alamofire
import SwiftyJSON
import NFCReaderWriter
import AVFoundation

class NFCreader_ViewController: UIViewController{
    
    
    
    let readerWriter = NFCReaderWriter.sharedInstance()

   
    @IBOutlet weak var view_main: UIImageView!
    
   
 
    
    override func viewDidLoad() {
        super.viewDidLoad()


      

        readerWriter.newReaderSession(with: self, invalidateAfterFirstRead: false, alertMessage: "스티커에 기기를 접근시켜주세요")
        readerWriter.begin()
        self.readerWriter.detectedMessage = "detected NFC Message"
        
        
    }
    
    
//    // implement NFCReaderDelegate to read tag info from NFC chip
//    func reader(_ session: NFCReader, didDetect tag: __NFCTag, didDetectNDEF message: NFCNDEFMessage) {
//        let tagId = readerWriter.tagIdentifier(with: tag)
//
//        let tagInfos = getTagInfos(tag)
//        let content =  contentsForMessages([message])
//        var tagInfosDetail = ""
//               tagInfos.forEach { (item) in
//                   tagInfosDetail = tagInfosDetail + "\(item.key): \(item.value)\n"
//               }
//        DispatchQueue.main.async {
//            self.showToast(message: "Read Tag Identifier:\(tagId.hexadecimal)"+"TagInfo:\n\(tagInfosDetail)\nNFCNDEFMessage:\n\(content)")
//        }
//        self.readerWriter.end()
//    }
    
//    func readButtonTapped() {
//        readerWriter.newReaderSession(with: self, invalidateAfterFirstRead: false, alertMessage: "스티커에 기기를 접근시켜주세요")
//        readerWriter.begin()
//        self.readerWriter.detectedMessage = "detected NFC Message"
//    }
//
//    func readTagIDButtonTapped() {
//       readerWriter.newWriterSession(with: self, isLegacy: false, invalidateAfterFirstRead: true, alertMessage: "Nearby NFC card for read tag identifier")
//       readerWriter.begin()
//       //readerWriter.detectedMessage = "detected Tag info"
//   }
//
//
//    // MARK: - Utilities
    func contentsForMessages(_ messages: [NFCNDEFMessage]) -> String {
        var recordInfos = ""

        for message in messages {
            for (i, record) in message.records.enumerated() {
                recordInfos += "Record(\(i + 1)):\n"
                recordInfos += "Type name format: \(record.typeNameFormat.rawValue)\n"
                recordInfos += "Type: \(record.type as NSData)\n"
                recordInfos += "Identifier: \(record.identifier)\n"
                recordInfos += "Length: \(message.length)\n"

                if let string = String(data: record.payload, encoding: .ascii) {
                    recordInfos += "Payload content:\(string)\n"
                }
                recordInfos += "Payload raw data: \(record.payload as NSData)\n\n"
            }
        }

        print("recordInfos")
        return recordInfos
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

    func getTagInfos(_ tag: __NFCTag) -> [String: Any] {
        var infos: [String: Any] = [:]

        switch tag.type {
        case .miFare:
            if let miFareTag = tag.asNFCMiFareTag() {
                switch miFareTag.mifareFamily {
                case .desfire:
                    infos["TagType"] = "MiFare DESFire"
                case .ultralight:
                    infos["TagType"] = "MiFare Ultralight"
                case .plus:
                    infos["TagType"] = "MiFare Plus"
                case .unknown:
                    infos["TagType"] = "MiFare compatible ISO14443 Type A"
                @unknown default:
                    infos["TagType"] = "MiFare unknown"
                }
                if let bytes = miFareTag.historicalBytes {
                    infos["HistoricalBytes"] = bytes.hexadecimal
                }
                infos["Identifier"] = miFareTag.identifier.hexadecimal
            }
        case .iso7816Compatible:
            if let compatibleTag = tag.asNFCISO7816Tag() {
                infos["TagType"] = "ISO7816"
                infos["InitialSelectedAID"] = compatibleTag.initialSelectedAID
                infos["Identifier"] = compatibleTag.identifier.hexadecimal
                if let bytes = compatibleTag.historicalBytes {
                    infos["HistoricalBytes"] = bytes.hexadecimal
                }
                if let data = compatibleTag.applicationData {
                    infos["ApplicationData"] = data.hexadecimal
                }
                infos["OroprietaryApplicationDataCoding"] = compatibleTag.proprietaryApplicationDataCoding
            }
        case .ISO15693:
            if let iso15693Tag = tag.asNFCISO15693Tag() {
                infos["TagType"] = "ISO15693"
                infos["Identifier"] = iso15693Tag.identifier
                infos["ICSerialNumber"] = iso15693Tag.icSerialNumber.hexadecimal
                infos["ICManufacturerCode"] = iso15693Tag.icManufacturerCode
            }
            
        case .feliCa:
            if let feliCaTag = tag.asNFCFeliCaTag() {
                infos["TagType"] = "FeliCa"
                infos["Identifier"] = feliCaTag.currentIDm
                infos["SystemCode"] = feliCaTag.currentSystemCode.hexadecimal
            }
        default:
            break
        }
        return infos
    }
}




extension  NFCreader_ViewController: NFCReaderDelegate {
    func readerDidBecomeActive(_ session: NFCReader) {
        print("Reader did become")
    }
    
    func reader(_ session: NFCReader, didInvalidateWithError error: Error) {
            print("ERROR:\(error)")
        self.readerWriter.end()
        }

    /// -----------------------------
    // MARK: - 1. NFC Reader(iOS 11):
    /// -----------------------------
    func reader(_ session: NFCReader, didDetectNDEFs messages: [NFCNDEFMessage]) {
        let  recordInfos = contentsForMessages(messages)
        let recordInfo = recordInfos.jsonKey
        print(recordInfo)
        
        DispatchQueue.main.async {
            self.showToast(message: "Read Tag recordInfos:\(recordInfos)")
        }
        readerWriter.end()
    }

    /// -----------------------------
    // MARK: - 2. NFC Writer(iOS 13):
    /// -----------------------------
    func reader(_ session: NFCReader, didDetect tags: [NFCNDEFTag]) {
        print("did detect tags")

        var payloadData = Data([0x02])
        let urls = ["apple.com", "google.com", "facebook.com"]
        payloadData.append(urls[Int.random(in: 0..<urls.count)].data(using: .utf8)!)

        let payload = NFCNDEFPayload.init(
            format: NFCTypeNameFormat.nfcWellKnown,
            type: "U".data(using: .utf8)!,
            identifier: Data.init(count: 0),
            payload: payloadData,
            chunkSize: 0)

        let message = NFCNDEFMessage(records: [payload])

        readerWriter.write(message, to: tags.first!) { (error) in
            if let err = error {
                print("ERR:\(err)")
            } else {
                print("write success")
            }
            self.readerWriter.end()
        }
    }
    
    /// --------------------------------
    // MARK: - 3. NFC Tag Reader(iOS 13)
    /// --------------------------------
    func reader(_ session: NFCReader, didDetect tag: __NFCTag, didDetectNDEF message: NFCNDEFMessage) {
        let tagId = readerWriter.tagIdentifier(with: tag)
        let content = contentsForMessages([message])
        
        let tagInfos = getTagInfos(tag)
        var tagInfosDetail = ""
        tagInfos.forEach { (item) in
            tagInfosDetail = tagInfosDetail + "\(item.key): \(item.value)\n"
        }
        
        DispatchQueue.main.async {
            self.showToast(message: "Read Tag Identifier:\(tagId.hexadecimal)"+"TagInfo:\n\(tagInfosDetail)\nNFCNDEFMessage:\n\(content)")
        }
        self.readerWriter.alertMessage = "NFC Tag Info detected"
        self.readerWriter.end()
    }
}

extension Data {
    /// Hexadecimal string representation of `Data` object.
    var hexadecimal: String {
        return map { String(format: "%02x", $0) }
            .joined()
    }
}
