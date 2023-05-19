//
//  TakingPhotoView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.
//

import UIKit
import AVFoundation

class TakingPhoto: UIViewController {
    let picker = UIImagePickerController()
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var pickImgview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cameraBtn.setImage(Image("takePhoto.png"), for: .normal)
        picker.delegate = self
    }
    @IBAction func imgPickerBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Select One", message: nil, preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "Album", style: .default) {(action) in self.openLibrary()}
        let camera = UIAlertAction(title: "Camera", style: .default) {(action) in self.openLibrary()}
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}

extension TakingPhoto : UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }

        else{
            print("Camera not available")
        }
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickImgview.image = image
            dismiss(animated: true, completion: nil)
        }
    }
    
}
